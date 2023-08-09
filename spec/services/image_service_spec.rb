require "rails_helper"

describe ImageService do
  describe "instance methods" do
    describe "#image_search" do
      it "returns images based on country query", :vcr do
        params = {
          country: "thailand"
        }

        image_results = ImageService.new(params).image_search
        expect(image_results[:results][0]).to have_key(:alt_description)
        expect(image_results[:results][0]).to have_key(:urls)
      end
    end
  end
end