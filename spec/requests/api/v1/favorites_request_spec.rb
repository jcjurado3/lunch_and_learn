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

      it "returns users favorites" do
        user = User.create!(name: "Grant", email: "goodboy@ruffruff.com", password: "treats4lyf", password_confirmation: "treats4lyf")

        fav1 = Favorite.create!(recipe_title: "Recipe: Egyptian Tomato Soup",
                                recipe_link: "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight....",
                                country: "egypt",
                                user_id: user.id )

        fav = Favorite.create(recipe_title: "Crab Fried Rice (Khaao Pad Bpu)",
                              recipe_link: "https://www.tastingtable.com/.....",
                              country: "thailand",
                              user_id: user.id )
                              
        get "/api/v1/favorites?api_key=#{user.api_key}"

        expect(response).to be_successful
        expect(response.status).to eq(200)
  
        fav_data = JSON.parse(response.body, symbolize_names: true)
  
        expect(fav_data).to have_key(:data)
        expect(fav_data[:data]).to be_an(Array)
  
        expect(fav_data[:data][0]).to have_key(:id)
        expect(fav_data[:data][0][:id]).to be_a(String)
  
        expect(fav_data[:data][0]).to have_key(:type)
        expect(fav_data[:data][0][:type]).to be_a(String)
        expect(fav_data[:data][0][:type]).to eq("favorite")
  
        expect(fav_data[:data][0]).to have_key(:attributes)
        expect(fav_data[:data][0][:attributes]).to be_a(Hash)
        expect(fav_data[:data][0][:attributes]).to have_key(:country)
        expect(fav_data[:data][0][:attributes][:country]).to be_a(String)
  
        expect(fav_data[:data][0][:attributes]).to have_key(:recipe_link)
        expect(fav_data[:data][0][:attributes][:recipe_link]).to be_a(String)
  
        expect(fav_data[:data][0][:attributes]).to have_key(:recipe_title)
        expect(fav_data[:data][0][:attributes][:recipe_title]).to be_a(String)
  
        expect(fav_data[:data][0][:attributes]).to have_key(:created_at)
        expect(fav_data[:data][0][:attributes][:created_at]).to be_a(String)
      end
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