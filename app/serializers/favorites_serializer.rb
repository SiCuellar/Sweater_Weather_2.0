class FavoritesSerializer
  include FastJsonapi::ObjectSerializer
  set_id :user_id
  attributes :favorites_cities_weather
end
