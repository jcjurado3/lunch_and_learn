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

  def service
    CountryService.new
  end
end