require "rails_helper"

RSpec.describe ApiImage do
  describe "existance" do

    it "returns list of videos that match country query", :vcr do
      params = {
        country: "thailand"
      }
      video = VideoSearchFacade.new(params).videos

      expect(video).to have_key(:data)
      expect(video[:data]).to have_key(:type)
      expect(video[:data][:type]).to be_a(String)
      expect(video[:data][:type]).to eq("learning_resource")
      expect(video[:data]).to have_key(:attributes)
      expect(video[:data][:attributes]).to have_key(:country)
      expect(video[:data][:attributes]).to have_key(:video)
      expect(video[:data][:attributes]).to have_key(:images)
      expect(video[:data][:attributes][:images][0].first).to have_key(:alt_tag)
      expect(video[:data][:attributes][:images][0].first).to have_key(:url)
    end    
  end
end