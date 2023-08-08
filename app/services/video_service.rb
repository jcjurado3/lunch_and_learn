class VideoService 
  def initialize(params)
    @country = params[:country]
  end

  def video_search
    response = conn.get('?') do |req|
      req.url '/youtube/v3/search/'
      req.params['channelId'] = "UCluQ5yInbeAkkeCndNnUhpw"
      req.params['q'] = @country
      req.params['key'] = ENV["YOUTUBE_API_KEY"]
      req.params['part'] = "snippet"
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://youtube.googleapis.com")
  end
end