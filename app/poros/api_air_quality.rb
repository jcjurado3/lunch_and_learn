class ApiAirQuality
  attr_reader :aqi,
              :pm25_concentration,
              :co_concentration,
              :city

  def initialize(data, capital_city)
    @aqi = data[:overall_aqi]
    @pm25_concentration = data[:"PM2.5"][:concentration]
    @co_concentration = data[:CO][:concentration]
    @city = capital_city
  end
end