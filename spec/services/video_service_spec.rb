require "rails_helper"

describe VideoService do
  describe "instance methods" do
    describe "#video_search" do
      it "returns video data based on country query", :vcr do
        params = {
          country: "thailand"
        }

        video_results = VideoService.new(params).video_search

        expect(video_results[:items][0][:id]).to have_key(:videoId)
        expect(video_results[:items][0][:snippet]).to have_key(:title)
      end
    end
  end
end