class GiphyWeatherMaker
  def initialize(location)
    @location = location
    @forecast_organizer = ForecastOrganizer.new(location)

  end

  def daily_gif
    @forecast_organizer.daily_weather.map do |day|
      GiphyService.new.get_gif(day.summary)
    end
    # binding.pry
  end

end
