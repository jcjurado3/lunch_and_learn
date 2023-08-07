class CountryService

  def get_random_country
    response = get_all_countries_url
  end
  def get_capital_city(country)
    response = get_capital_url(country)
  end

  private
  def rest_conn
    Faraday.new("https://restcountries.com")
  end

  def get_all_countries_url
    response = rest_conn.get('?') do |req|
      req.url '/v3.1/name/all'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_capital_url(country)
    response = rest_conn.get('?') do |req|
      req.url "/v3.1/name/#{country}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end