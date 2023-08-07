require "rails_helper"

RSpec.describe "Air Quality Endpoint" do
  describe "api/v1/air_quality" do
    describe "happy path" do
      it "returns aqi, pm25, and co concentration for capital of country passed", :vcr do
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

        expect(capital_data[:data][:city]).to eq("Abuja")

        expect(capital_data[:data][:attributes]).to have_key(:aqi)
        expect(capital_data[:data][:attributes][:aqi]).to be_an(Integer)


        expect(capital_data[:data][:attributes]).to have_key(:pm25_concentration)
        expect(capital_data[:data][:attributes][:pm25_concentration]).to be_a(Float)


        expect(capital_data[:data][:attributes]).to have_key(:co_concentration)
        expect(capital_data[:data][:attributes][:co_concentration]).to be_a(Float)

      end
      it "happy path test: France", :vcr do
        query_params = {
          country: "France" 
        }

        get "/api/v1/air_quality", params: query_params

        capital_data = JSON.parse(response.body, symbolize_names: :true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(capital_data).to have_key(:data)
        expect(capital_data[:data]).to have_key(:type)
        expect(capital_data[:data]).to have_key(:city)
        expect(capital_data[:data]).to have_key(:attributes)

        expect(capital_data[:data][:city]).to eq("Paris")

        expect(capital_data[:data][:attributes]).to have_key(:aqi)
        expect(capital_data[:data][:attributes][:aqi]).to be_an(Integer)


        expect(capital_data[:data][:attributes]).to have_key(:pm25_concentration)
        expect(capital_data[:data][:attributes][:pm25_concentration]).to be_a(Float)


        expect(capital_data[:data][:attributes]).to have_key(:co_concentration)
        expect(capital_data[:data][:attributes][:co_concentration]).to be_a(Float)

      end

      it "happy path: Cuba", :vcr do
        query_params = {
          country: "Cuba" 
        }

        get "/api/v1/air_quality", params: query_params

        capital_data = JSON.parse(response.body, symbolize_names: :true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(capital_data).to have_key(:data)
        expect(capital_data[:data]).to have_key(:type)
        expect(capital_data[:data]).to have_key(:city)
        expect(capital_data[:data]).to have_key(:attributes)

        expect(capital_data[:data][:city]).to eq("Havana")

        expect(capital_data[:data][:attributes]).to have_key(:aqi)
        expect(capital_data[:data][:attributes][:aqi]).to be_an(Integer)


        expect(capital_data[:data][:attributes]).to have_key(:pm25_concentration)
        expect(capital_data[:data][:attributes][:pm25_concentration]).to be_a(Float)


        expect(capital_data[:data][:attributes]).to have_key(:co_concentration)
        expect(capital_data[:data][:attributes][:co_concentration]).to be_a(Float)

      end
    end
  end
end