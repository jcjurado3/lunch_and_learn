class RecipeSearchFacade
  def initialize(params)
    @params = params
  end

  def recipes
    recipe_search_result = RecipeService.new(@params).recipe_by_query

    recipe_result = recipe_search_result[:hits][0]

    recipe_cleaned = recipe_data_clean_up(recipe_result)

    recipe = ApiRecipe.new(recipe_cleaned)
    # recipe = recipe_search_result[:hits][0].map do |recipe_data|
    #   clean_data = recipe_data_clean_up(recipe_data)
    #   recipe = ApiRecipe.new(clean_data, @params)
    #   recipe
    # end
    
  end

  private
  def recipe_data_clean_up(recipe_data)
    # require 'pry'; binding.pry
    recipe_hash = {
        title: recipe_data[:recipe][:label],
        url: recipe_data[:recipe][:uri],
        country: @params[:country],
        image: recipe_data[:recipe][:image]
      }
  end
end