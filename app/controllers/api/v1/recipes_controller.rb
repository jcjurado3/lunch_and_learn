class Api::V1::RecipesController < ApplicationController
  def index
    fetch_recipe = RecipeSearchFacade.new(params).recipes
    fetch_recipe = [fetch_recipe] unless fetch_recipe.is_a?(Array)
    render json: ApiRecipeSerializer.new(fetch_recipe)
  end
end