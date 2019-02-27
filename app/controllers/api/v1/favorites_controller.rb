class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    # binding.pry
    if user
      render json: FavoritesSerializer.new(FavoriteDataMaker.new(user))
    else
      render json: "Fail", status: 401
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      fav_loc = Favorite.find_or_create_by(location: params[:location].split.join.downcase)
      user.user_favorites.create(favorite_id: fav_loc.id)
      render json: "You got this!", status: 204
    else
      render json: "Fail", status: 401
    end
  end

  def destroy
    user = User.find_by(api_key: params[:api_key])
    if user
      unfav = user.favorites.find_by(location: params[:location])
      render json: FavoritesSerializer.new(FavoriteDataMaker.new(user))
      unfav.destroy
      render json: "Good Job", status: 204
    else
      render json: "Fail", status: 401
    end
  end
end
