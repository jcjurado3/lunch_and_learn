class Api::V1::RecipesController < ApplicationController
  def index
    fetch_recipe = RecipeSearchFacade.new(params).recipes
    render json: ApiRecipeSerializer.new(fetch_recipe)
  end
end