class RecipeSearchFacade
  def initialize(params)
    @params = params
    
  end

  def recipes
      recipe_search_result = RecipeService.new(@params).recipe_by_query
      recipe_results = recipe_search_result[:hits]
      recipe_results.map do |recipe_data|
        recipe_cleaned = recipe_data_clean_up(recipe_data)
        recipe = ApiRecipe.new(recipe_cleaned)
    end
  end

  private
  def recipe_data_clean_up(recipe_data)
    recipe_hash = {
        title: recipe_data[:recipe][:label],
        url: recipe_data[:recipe][:uri],
        country: @params[:country],
        image: recipe_data[:recipe][:image]
      }
  end
end