class Api::V1::UsersController < ApplicationController

  def create

    # new_user = User.create_user(user_params)
    user = User.create(create_user_params)
    user[:api_key] = SecureRandom.uuid
    response = {"api_key" => "#{user.api_key}"}
    render json: response
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def create_user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
