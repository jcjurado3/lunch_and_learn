class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: ErrorUserSerializer.new(user.errors.full_messages.join(", "), "Not Created", "422").serialized_json, status: 422
    end
  end

  private
  
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end