require "rails_helper"

RSpec.describe "Learning Resources Search Endpoint" do
  describe "api/v1/learning_resources" do
    it "?country=" do
      query_params = {
          country: "thailand" 
        }

        get "/api/v1/learning_resources", params: query_params

        learning_resources_data = JSON.parse(response.body, symbolize_names: :true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(learning_resources_data).to have_key(:data)
        expect(learning_resources_data[:data][0]).to have_key(:type)
        expect(learning_resources_data[:data][0][:type]).to be_a(String)
        expect(learning_resources_data[:data][0][:type]).to eq("learning_resources")
    end
  end
end