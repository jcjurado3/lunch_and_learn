class AirQualityService
  def get_aq_data(capital_city)
    response = get_aq_data_url(capital_city)
  end

  private
    def conn
      Faraday.new("https://api.api-ninjas.com")
    end

    def get_aq_data_url(capital_city)
      response = conn.get('?') do |req|
        req.url "/v1/airquality"
        req.headers['X-Api-Key'] = ENV["NINJA_API_KEY"]
        req.params['city'] = capital_city
      end
      JSON.parse(response.body, symbolize_names: true)
    end
end