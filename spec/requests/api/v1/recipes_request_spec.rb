require "rails_helper"

RSpec.describe "Recipe Search Endpoint" do
  describe "api/v1/recipes" do
    context "recipe search external api" do
      it "returns data about specific country", :vcr do
        query_params = {
          country: "thailand" 
        }

        get "/api/v1/recipes", params: query_params

        recipe_data = JSON.parse(response.body, symbolize_names: :true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(recipe_data).to have_key(:data)
        expect(recipe_data[:data][0]).to have_key(:type)
        expect(recipe_data[:data][0][:type]).to be_a(String)
        expect(recipe_data[:data][0][:type]).to eq("recipe")


        expect(recipe_data[:data][0][:attributes]).to have_key(:title)
        expect(recipe_data[:data][0][:attributes]).to have_key(:url)
        expect(recipe_data[:data][0][:attributes]).to have_key(:country)
        expect(recipe_data[:data][0][:attributes]).to have_key(:image)
      end

      it "returns data when no country is given", :vcr do
        query_params = {
          country: "" 
        }

        get "/api/v1/recipes", params: query_params

        recipe_data = JSON.parse(response.body, symbolize_names: :true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(recipe_data).to have_key(:data)
        expect(recipe_data[:data][0]).to have_key(:type)
        expect(recipe_data[:data][0][:type]).to be_a(String)
        expect(recipe_data[:data][0][:type]).to eq("recipe")


        expect(recipe_data[:data][0][:attributes]).to have_key(:title)
        expect(recipe_data[:data][0][:attributes]).to have_key(:url)
        expect(recipe_data[:data][0][:attributes]).to have_key(:country)
        expect(recipe_data[:data][0][:attributes]).to have_key(:image)
      end
    end
  end
end