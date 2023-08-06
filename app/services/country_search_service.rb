class CountrySearchService

  def get_random_country
    response = get_url
  end

  private
  def rest_conn
    Faraday.new("https://restcountries.com")
  end

  def get_url
    response = rest_conn.get('?') do |req|
      req.url '/v3.1/name/all'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end