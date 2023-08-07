class Api::V1::AirQualityController < ApplicationController
  def index
    capital_city = CountrySearchFacade.new.get_capital_city(params[:country])
    air_quality = AirQualitySearchFacade.new(capital_city).get_aq_data
    air_quality_serialized = ApiAirQualitySerializer.new(air_quality).serializable_hash

    render json: {
      data: {
        id: nil,
        type: "air_quality",
        city: capital_city,
        attributes: air_quality_serialized[:data][:attributes]
      }
    }
  end
end