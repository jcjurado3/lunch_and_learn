require "rails_helper"

RSpec.describe AirQualityService do
  describe "instance methods" do
    describe "#get_aq_data" do
      it "returns api response from Api Ninja with air quality data", :vcr do
        air_quality_result = AirQualityService.new.get_aq_data("Paris")
      
        expect(air_quality_result).to have_key(:CO)
        expect(air_quality_result[:CO]).to have_key(:concentration)
        expect(air_quality_result).to have_key(:"PM2.5")
        expect(air_quality_result[:"PM2.5"]).to have_key(:concentration)
        expect(air_quality_result).to have_key(:overall_aqi)

      end
    end
  end
end