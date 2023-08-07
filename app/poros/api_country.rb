class ApiCountry
  attr_accessor :country

  def initialize(data)

    @country = data[:name][:common]
  end
end