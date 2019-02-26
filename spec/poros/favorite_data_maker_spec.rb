require 'rails_helper'

describe "favorite data maker " do
  it 'can get weather data for favorites' do
    VCR.use_cassette("weather_data_favorite") do
      user_1 = User.create(email: 'whatever@example.com', password: 'password', api_key: 'iwantajob')
      fav_city_1 =Favorite.create(location: 'denver, CO')
      fav_city_2 =Favorite.create(location: 'el paso, Tx')
      fav_city_3 =Favorite.create(location: 'Los Angeles, CA')
      user_1.user_favorites.create(favorite_id: fav_city_1.id)
      user_1.user_favorites.create(favorite_id: fav_city_2.id)
      user_1.user_favorites.create(favorite_id: fav_city_3.id)

      data_maker = FavoriteDataMaker.new(user_1)

      expect(data_maker).to be_an_instance_of(FavoriteDataMaker)
      expect(data_maker.favorites_cities_weather).to be_a(Array)
    end
  end
end
