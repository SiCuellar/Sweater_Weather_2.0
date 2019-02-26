class FavoriteDataMaker
  attr_reader :user_id

  def initialize(user)
    @user_id = user.id
    @user = user
    @favs = user.favorites
  end

  def favorites_cities_weather
    @favs.map do |favorite|
      ForecastOrganizer.new(favorite.location)
    end
  end
end
