class RecipeSearchFacade
  def initialize(params)
    @params = params
  end

  def recipes
    recipe_search_result = RecipeService.new(@params).recipe_by_query

    recipe_search_result[:hits][0].each do |recipe_data|
      recipe_hash = { id: null, 
        title: recipe_data[1][:label],
        url: recipe_data[1][:uri],
        country: @params[:country],
        image: recipe_data[1][:image]
      }
      ApiRecipe.new(recipe_hash)
    end
    require 'pry'; binding.pry
  end
end