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
      end
    end
  end
end