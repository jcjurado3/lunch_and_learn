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
    
    describe "#get_random_country_only", :vcr do
      it "returns random country" do
        country = CountrySearchFacade.new.random_country_only

        expect(country).to have_key(:country)
        expect(country[:country]).to be_a(String)

      end
    end
  end
end