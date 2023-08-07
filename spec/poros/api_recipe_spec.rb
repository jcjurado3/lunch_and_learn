require "rails_helper"

RSpec.describe ApiRecipe do
  describe "existance" do

    it "returns list of recipes that match country query", :vcr do
      params = {
        country: "thailand"
      }
      recipes = RecipeSearchFacade.new(params).recipes
      expect(recipes).to be_an(Array)
      expect(recipes.first).to be_a(ApiRecipe)
      expect(recipes.first.title).to be_a(String)
      expect(recipes.first.url).to be_a(String)
      expect(recipes.first.image).to be_a(String)
      expect(recipes.first.country).to be_a(String)
      expect(recipes.first.country).to eq("thailand")
    end    
  end
end