require "rails_helper"

RSpec.describe "Air Quality Endpoint" do
  describe "api/v1/air_quality" do
    describe "happy path" do
      it "returns aqi, pm25, and co concentration for capital of country passed" do
        query_params = {
          country: "Nigeria" 
        }

        get "/api/v1/air_quality", params: query_params

        capital_data = JSON.parse(response.body, symbolize_names: :true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(capital_data).to have_key(:data)
        expect(capital_data[:data]).to have_key(:type)
        expect(capital_data[:data]).to have_key(:city)
        expect(capital_data[:data]).to have_key(:attributes)

      end
    end
  end
end