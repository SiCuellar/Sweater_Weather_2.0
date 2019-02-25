class DayWeather
  attr_reader :time,
              :summary,
              :precip,
              :temp_high,
              :temp_low,
              :visibility,
              :icon

  def initialize(day_weather_data)
    @time = day_weather_data[:time]
    @summary = day_weather_data[:summary].gsub(/[^0-9a-z ]/i, '')
    @icon = day_weather_data[:icon]
    @precip = day_weather_data[:precipProbability]
    @temp_high = day_weather_data[:temperatureHigh]
    @temp_low = day_weather_data[:temperatureLow]
    @visibility = day_weather_data[:visibility]
  end
end
