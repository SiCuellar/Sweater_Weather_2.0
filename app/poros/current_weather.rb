class CurrentWeather
  attr_reader :time,
              :summary,
              :precip,
              :temp,
              :humidity,
              :uv_index,
              :visibility,
              :temp_feel_like

  def initialize(current_weather_data)
    @time = current_weather_data[:time]
    @summary = current_weather_data[:summary]
    @precip = current_weather_data[:precipProbability]
    @temp = current_weather_data[:temperature]
    @temp_feel_like = current_weather_data[:apparentTemperature]
    @humidity = current_weather_data[:humidity]
    @uv_index = current_weather_data[:uvIndex]
    @visibility = current_weather_data[:visibility]
  end
end
