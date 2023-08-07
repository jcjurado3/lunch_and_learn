class AirQualitySearchFacade
  def initialize(capital_city)
    @capital_city = capital_city
  end

  def get_aq_data
    aq_results = service.get_aq_data(@capital_city)
    ApiAirQuality.new(aq_results, @capital_city)
  end

  def service
    AirQualityService.new
  end
end