class ApiRecipe
  attr_reader :id,
              :title,
              :url,
              :image,
              :country

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @url = data[:url]
    @image = data[:image]
    @country = data[:country]

  end
end