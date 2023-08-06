class ApiRecipe
  attr_reader :title,
              :url,
              :image,
              :country

  def initialize(data)
    @title = data[:title]
    @url = data[:url]
    @image = data[:image]
    @country = data[:country]
  end
end