require "rails_helper"

RSpec.describe CountryService do
  describe "instance methods" do
    describe "#get_random_country" do
      it "returns random country", :vcr do
        country_results = CountryService.new.get_random_country
      
        expect(country_results).to be_an(Array)
        expect(country_results[0][:name]).to have_key(:common)
        expect(country_results[0][:name][:common]).to be_a(String)

      end
    end
  end
end