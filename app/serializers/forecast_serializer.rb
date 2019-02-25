class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location
  attributes :current_weather, :daily_weather, :hourly_weather
end
