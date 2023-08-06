class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country] == ""
      recipes = CountrySearchFacade.new.get_random_country
    else
      recipes = RecipeSearchFacade.new(params).recipes
    end

    render json: ApiRecipeSerializer.new(recipes)
  end

end