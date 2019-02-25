class HourWeather
  attr_reader :time,
              :summary,
              :icon,
              :precip,
              :temp

  def initialize(hour_weather_data)
    @time = hour_weather_data[:time]
    @summary = hour_weather_data[:summary]
    @icon = hour_weather_data[:icon]
    @precip = hour_weather_data[:precipProbability]
    @temp = hour_weather_data[:temperature]
  end
end
