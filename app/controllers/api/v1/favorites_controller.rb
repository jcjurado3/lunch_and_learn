class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if !user
      return render json: ErrorUserSerializer.new("Unauthorized request", "Forbidden", "403").serialized_json, status: 403
    end  

    user_favorites = user.favorites
    render json: FavoritesSerializer.new(user_favorites)
  end
  
  def create
    user = User.find_by(api_key: params[:api_key])
    if !user
      return render json: ErrorUserSerializer.new("Unauthorized request", "Forbidden", "403").serialized_json, status: 403
    end   
      favorite = Favorite.create(favorite_params)
      favorite.update!(user_id: user.id)
      render json: { success: "Favorite added successfully" }, status: 201
  end

  private
  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title, :user_id)
  end
end