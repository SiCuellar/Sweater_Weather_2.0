class GifDayWeather
  attr_reader :time,
              :summary,
              :gif_url

  def initialize(day_weather_data)
    @time = day_weather_data[:time]
    @summary = day_weather_data[:summary].gsub(/[^0-9a-z ]/i, '')
    gif_url = GiphyService.new.get_gif(@summary)
    @gif_url = gif_url
  end
end
