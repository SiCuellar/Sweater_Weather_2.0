class FavoriteDataMaker
  def initialize(user)
    @user_id = user.id
    @user = user
    @favs = user.favorites
  end

  def favorites_cities_weather
    x=@favs.map do |fav_location|
      ForecastOrganizer.new(fav_location)
    end
    binding.pry

  end
end
