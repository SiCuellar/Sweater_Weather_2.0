class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      fav_loc = Favorite.find_or_create_by(location: params[:location].split.join.downcase)
      user.user_favorites.create(favorite_id: fav_loc.id)
      render json: "You got this!", status: 204
    else
      render json: "Fail", status: 404
    end
  end
end
