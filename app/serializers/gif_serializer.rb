class GifSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location
  attributes :gif_daily_weather
end
