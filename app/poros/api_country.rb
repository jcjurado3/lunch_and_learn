class ApiCountry
  attr_reader :country

  def initialize(data)

    @country = data[:name][:common]
  end
end