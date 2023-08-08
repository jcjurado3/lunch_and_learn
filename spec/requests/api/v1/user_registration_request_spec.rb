require "rails_helper"

RSpec.describe "User Registration Endpoint" do
  describe "/api/v1/users" do
    describe "happy path" do
      it "creates users" do
        query_params = {
          name: "Odell",
          email: "goodboy@ruffruff.com",
          password: "treats4lyf",
          password_confirmation: "treats4lyf" 
        }
        headers = { 'CONTENT_TYPE' => 'application/json' }

        post "/api/v1/users", headers: headers, params: JSON.generate(query_params)

        user_data = JSON.parse(response.body, symbolize_names: :true)

        expect(response).to be_successful
        expect(response.status).to eq(201)

        expect(user_data).to have_key(:data)
        expect(user_data[:data]).to have_key(:type)
        expect(user_data[:data][:type]).to be_a(String)
        expect(user_data[:data][:type]).to eq("user")

        expect(user_data[:data]).to have_key(:attributes)
        expect(user_data[:data][:attributes]).to have_key(:name)
        expect(user_data[:data][:attributes]).to have_key(:email)
        expect(user_data[:data][:attributes]).to have_key(:api_key)

        expect(user_data[:data][:attributes][:name]).to be_a(String)
        expect(user_data[:data][:attributes][:name]).to eq("Odell")



      end
    end

    describe "sad path" do
      it "error message when email is not unique" do
        user = User.create!(name: "Grant", email: "goodboy@ruffruff.com", password: "abc", password_confirmation: "abc")
        
        query_params = {
          name: "Odell",
          email: "goodboy@ruffruff.com",
          password: "treats4lyf",
          password_confirmation: "treatslyf" 
        }
        headers = { 'CONTENT_TYPE' => 'application/json' }

        post "/api/v1/users", headers: headers, params: JSON.generate(query_params)

        user_data = JSON.parse(response.body, symbolize_names: :true)

        expect(response).to_not be_successful
        expect(response.status).to eq(422)
      end

      it "error message when user field is missing" do
        query_params = {
          name: "Odell",
          email: "goodboy@ruffruff.com",
          password: "treats4lyf",
          password_confirmation: "tretslyf" 
        }
        headers = { 'CONTENT_TYPE' => 'application/json' }

        post "/api/v1/users", headers: headers, params: JSON.generate(query_params)

        user_data = JSON.parse(response.body, symbolize_names: :true)

        expect(response).to_not be_successful
        expect(response.status).to eq(422)
      end

      it "error message when user password doesnt match" do
        query_params = {
          name: "Odell",
          email: "goodboy@ruffruff.com",
          password_confirmation: "treatslyf" 
        }
        headers = { 'CONTENT_TYPE' => 'application/json' }

        post "/api/v1/users", headers: headers, params: JSON.generate(query_params)

        user_data = JSON.parse(response.body, symbolize_names: :true)

        expect(response).to_not be_successful
        expect(response.status).to eq(422)
      end
    end
  end
end