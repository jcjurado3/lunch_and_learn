class ImageService
  def initialize(params)
    @country = params[:country]
  end

  def image_search
    response = conn.get('?') do |req|
      req.url '/search/photos'
      req.params['page'] = "1"
      req.params['query'] = @country
      req.params['client_id'] = ENV["UNSPLASH_API_KEY"]
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.unsplash.com")
  end
end