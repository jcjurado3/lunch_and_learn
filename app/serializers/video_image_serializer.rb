class VideoImageSerializer
  def initialize(video, images, params)
    @video = video
    @images = images
    @country = params[:country]
  end

  def serializes_hash
    {
    "data": {
        "id": nil,
        "type": "learning_resource",
        "attributes": {
            "country": @country,
            "video": {
                "title": @video.title,
                "youtube_video_id": @video.youtube_video_id
            },
            "images": [
              serialized_images
              ]
        }
    }
}
  end

  private

  def serialized_images
    @images.map do |image|
      {
        "alt_tag": image.alt_tag,
        "url": image.url
      }
    end
  end
end