require "rails_helper"

RSpec.describe "Learning Resources Search Endpoint" do
  describe "api/v1/learning_resources" do
    it "?country=", :vcr do
      query_params = {
          country: "thailand" 
        }

        get "/api/v1/learning_resources", params: query_params

        learning_resources_data = JSON.parse(response.body, symbolize_names: :true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(learning_resources_data).to have_key(:data)
        # require 'pry'; binding.pry
        expect(learning_resources_data[:data]).to have_key(:type)
        expect(learning_resources_data[:data][:type]).to be_a(String)
        expect(learning_resources_data[:data][:type]).to eq("learning_resource")
        expect(learning_resources_data[:data]).to have_key(:attributes)
        expect(learning_resources_data[:data][:attributes]).to have_key(:country)
        expect(learning_resources_data[:data][:attributes]).to have_key(:video)
        expect(learning_resources_data[:data][:attributes][:video]).to have_key(:title)
        expect(learning_resources_data[:data][:attributes][:video]).to have_key(:youtube_video_id)
        expect(learning_resources_data[:data][:attributes]).to have_key(:images)
        expect(learning_resources_data[:data][:attributes][:images][0].count).to eq(10)
        expect(learning_resources_data[:data][:attributes][:images][0].first).to have_key(:alt_tag)
        expect(learning_resources_data[:data][:attributes][:images][0].first).to have_key(:url)
    end
  end
end