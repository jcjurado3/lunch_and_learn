require "rails_helper"

RSpec.describe "Recipe Search Endpoint" do
  describe "api/v1/recipes" do
    context "recipe search external api" do
      it "returns data about specific country" do
        query_params = {
          q: "thailand" 
        }

        get "api/v1/recipes", params: query_params

        recipe_data = JSON.parse(response.body, symbolize_names: :true)
        expect(response).to be_successful
        expect(response.status).to eq(200)

        expect(recipes_data).to have_key(:hits)
        expect(recipes_data[:hits][0]).to have_key(:recipe)
        expect(recipes_data[:data][0][:recipe]).to be_a(String)
      end
    end
  end
end