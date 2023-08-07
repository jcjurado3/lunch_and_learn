require "rails_helper"

RSpec.describe AirQualitySearchFacade do
  describe "class methods" do
    describe "#get_aq_data" do
      it "returns air quality data from city passed in", :vcr do
        air_quality_data = AirQualitySearchFacade.new("Paris").get_aq_data

        expect(air_quality_data).to be_a(ApiAirQuality)
        expect(air_quality_data.city).to be_a(String)
        expect(air_quality_data.city).to eq("Paris")
        expect(air_quality_data.aqi).to be_a(Integer)
        expect(air_quality_data.pm25_concentration).to be_a(Float)
        expect(air_quality_data.co_concentration).to be_a(Float)
      end
    end
  end
end