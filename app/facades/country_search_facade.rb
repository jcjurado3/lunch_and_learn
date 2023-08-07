class CountrySearchFacade
  def get_random_country
    country_results = service.get_random_country
    results = country_results.map do |country|
      ApiCountry.new(country)
    end
    country = results.sample
    country_hash = {
      country: country.country
    }

    random = RecipeSearchFacade.new(country_hash).recipes
  end

  def get_capital_city(country)
    city_request_data = service.get_capital_city(country)
    capital_city = city_request_data[0][:capital].first
  end

  def service
    CountryService.new
  end
end