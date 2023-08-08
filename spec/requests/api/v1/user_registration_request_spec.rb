require "rails_helper"

RSpec.describe "User Registration Endpoint" do
  describe "/api/v1/users" do
    describe "happy path" do
      it "creats users" do
        query_params = {
          name: "Odell",
          email: "goodboy@ruffruff.com",
          password: "treats4lyf",
          password_confirmation: "treats4lyf" 
        }

        post "/api/v1/users"  params: JSON.generate(query_params)

        user_data = JSON.parse(response.body, symbolize_names: :true)

        expect(response).to be_successful
        expect(response.status).to eq(201)

        expect(user_data).to have_key(:data)
        expect(user_data[:data]).to have_key(:type)
        expect(user_data[:data][:type]).to be_a(String)
        expect(user_data[:data][:type]).to eq("learning_resource")
      end
    end
  end
end