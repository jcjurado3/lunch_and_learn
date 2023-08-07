require "rails_helper"

RSpec.describe CountrySearchFacade do
  describe "class methods" do
    describe "#get_random_country" do
      it "returns list of recipes that from random country query", :vcr do

        recipes = CountrySearchFacade.new.get_random_country
        expect(recipes).to be_an(Array)
        expect(recipes.first.title).to be_a(String)
        expect(recipes.first.url).to be_a(String)
        expect(recipes.first.image).to be_a(String)
        expect(recipes.first.country).to be_a(String)
      end
    end
    
  end
end