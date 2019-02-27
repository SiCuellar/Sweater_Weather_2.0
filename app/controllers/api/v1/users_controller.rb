class Api::V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    new_user = User.create_user(user_params)
    response = {"api_key" => "#{new_user.api_key}"}
    render json: response
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
