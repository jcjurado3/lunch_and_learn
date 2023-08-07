require "rails_helper"

describe RecipeService do
  describe "instance methods" do
    describe "#recipe_by_query" do
      it "returns recipe data based on country query", :vcr do
        params = {
          country: "thailand"
        }

        recipe_results = RecipeService.new(params).recipe_by_query

        expect(recipe_results[:hits][0][:recipe]).to have_key(:label)
        expect(recipe_results[:hits][0][:recipe]).to have_key(:uri)
        expect(recipe_results[:hits][0][:recipe]).to have_key(:image)
      end
    end
  end
end