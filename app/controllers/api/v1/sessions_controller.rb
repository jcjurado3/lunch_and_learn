class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: ErrorUserSerializer.new(user.errors.full_messages.join(", "), "Not Created", "422").serialized_json, status: 422
    end
  end
end