class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location
  attributes :current, :daily_weather, :hourly_weather
end
