class Api::V1::SessionsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user = User.find_by(email: params[:email])
    user && user.authenticate(params[:password])
    session[:user_id] = user.id
    response = {"api_key" => "#{user.api_key}"}
    render json: response
  end
end
