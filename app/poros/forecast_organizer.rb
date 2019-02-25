class ForecastOrganizer
  def initialize(location)
    coordinates = GoogleMapsService.new.get_coordinates(location)
    @weather_data = DarkskyService.new.get_forcast(coordinates[:lat], coordinates[:lng])
  end

  def current_weather
    CurrentWeather.new(@weather_data[:currently])
  end

  def daily_weather
    @weather_data[:daily][:data].map do |day_data|
      DayWeather.new(day_data)
    end.first(7)
  end
end
