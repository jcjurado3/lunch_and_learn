class ApiAirQualitySerializer
  include JSONAPI::Serializer

set_type :air_quality
set_id { nil }
attributes :aqi,
            :pm25_concentration,
            :co_concentration
end