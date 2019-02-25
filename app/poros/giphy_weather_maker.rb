class GiphyWeatherMaker
  def initialize(location)
    @location = location
    @forecast_organizer = ForecastOrganizer.new(location)
    
  end

end
