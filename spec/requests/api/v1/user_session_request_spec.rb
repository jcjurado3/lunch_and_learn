require "rails_helper"

RSpec.describe "User Session Endpoint" do
  describe "/api/v1/sessions" do
    describe "happy path" do
      it "user logs in" do
        user = User.create!(name: "Grant", email: "goodboy@ruffruff.com", password: "treats4lyf", password_confirmation: "treats4lyf")

        query_params = {
          email: "goodboy@ruffruff.com",
          password: "treats4lyf",
        }  

        headers = { 'CONTENT_TYPE' => 'application/json' }

        post "/api/v1/sessions", headers: headers, params: JSON.generate(query_params)

        user_data = JSON.parse(response.body, symbolize_names: :true)

        expect(response).to be_successful
        expect(response.status).to eq(200)

        expect(user_data).to have_key(:data)
        expect(user_data[:data]).to have_key(:type)
        expect(user_data[:data][:type]).to be_a(String)
        expect(user_data[:data][:type]).to eq("user")

        expect(user_data[:data]).to have_key(:attributes)
        expect(user_data[:data][:attributes]).to have_key(:name)
        expect(user_data[:data][:attributes]).to have_key(:email)
        expect(user_data[:data][:attributes]).to have_key(:api_key)

        expect(user_data[:data][:attributes][:name]).to be_a(String)
        expect(user_data[:data][:attributes][:name]).to eq("Grant")

        expect(user_data[:data][:attributes][:email]).to be_a(String)
        expect(user_data[:data][:attributes][:email]).to eq("goodboy@ruffruff.com")

        expect(user_data[:data][:attributes][:api_key]).to be_a(String)
      end
    end

    describe "Sad Path" do
      it "error logging in" do
        user = User.create!(name: "Grant", email: "goodboy@ruffruff.com", password: "treats4lyf", password_confirmation: "treats4lyf")

        query_params = {
          email: "goodboy@ruffruff.com",
          password: "treatslyf",
        }  

        headers = { 'CONTENT_TYPE' => 'application/json' }

        post "/api/v1/sessions", headers: headers, params: JSON.generate(query_params)

        user_data = JSON.parse(response.body, symbolize_names: :true)

        expect(response).to_not be_successful
        expect(response.status).to eq(422)
      end
    end
  end
end