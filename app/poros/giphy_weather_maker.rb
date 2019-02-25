class GiphyWeatherMaker
  attr_reader :location

  def initialize(location)
    @location = location
    coordinates = GoogleMapsService.new.get_coordinates(location)
    @weather_data = DarkskyService.new.get_forcast(coordinates[:lat], coordinates[:lng])
  end

  def gif_daily_weather
    @weather_data[:daily][:data].map do |day_data|
      GifDayWeather.new(day_data)
    end.first(7)
  end
end
