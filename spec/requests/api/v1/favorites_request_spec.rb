require "rails_helper"

RSpec.describe "Favorites Endpoint" do
  describe "/api/v1/favorites" do
    describe "happy path" do
      it "adds favorites" do
        user = User.create!(name: "Grant", email: "goodboy@ruffruff.com", password: "treats4lyf", password_confirmation: "treats4lyf")
        query_params = {
          "api_key": user.api_key,
          "country": "thailand",
          "recipe_link": "https://www.tastingtable.com/.....",
          "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }
      post "/api/v1/favorites", headers: headers, params: JSON.generate(query_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to have_key(:success)
      expect(user[:success]).to be_a(String)
      expect(user[:success]).to eq("Favorite added successfully")
      end

      it ""
    end

    describe "sad path" do
      it "returns error with wrong api key" do
        user = User.create!(name: "Grant", email: "goodboy@ruffruff.com", password: "treats4lyf", password_confirmation: "treats4lyf")
        query_params = {
          "api_key": "re908r3r3r89ererwer",
          "country": "thailand",
          "recipe_link": "https://www.tastingtable.com/.....",
          "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }
      post "/api/v1/favorites", headers: headers, params: JSON.generate(query_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(403)

      error_data = JSON.parse(response.body, symbolize_names: :true)
      expect(error_data).to have_key(:errors)
      expect(error_data[:errors][0]).to have_key(:status)
      expect(error_data[:errors][0][:status]).to eq("Forbidden")

      expect(error_data[:errors][0]).to have_key(:message)
      expect(error_data[:errors][0][:message]).to eq("Unauthorized request")

      expect(error_data[:errors][0]).to have_key(:code)
      expect(error_data[:errors][0][:code]).to eq("403")
      end
    end
  end
end