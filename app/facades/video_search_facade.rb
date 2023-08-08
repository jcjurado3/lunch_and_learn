class VideoSearchFacade
  def initialize(params)
    @params = params
  end

  def videos
    video_search_results = service(@params).video_search
    video = clean_video_results(video_search_results)
    image_search_results = image_service(@params).image_search
    images = clean_images_results(image_search_results)

    VideoImageSerializer.new(video, images, @params).serializes_hash
  end

  private
    def service(params)
      VideoService.new(params)
    end

    def clean_video_results(data)
      video_data = data[:items].first
      ApiVideo.new(video_data)
    end

    def clean_images_results(data)
      data[:results].map do |image_data|
        ApiImage.new(image_data)
      end
    end

    def image_service(params)
      ImageService.new(params)
    end
end