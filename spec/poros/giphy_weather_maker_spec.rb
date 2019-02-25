require 'rails_helper'

describe 'giphy weather maker' do
  it "can make days with gifs in each one" do
    location = "Denver, CO"
    g_weather_maker = GiphyWeatherMaker.new(location)

    expect(g_weather_maker).to be_an_instance_of(GiphyWeatherMaker)
    # expect(forecast_organizer.current_weather).to be_an_instance_of(CurrentWeather)
  end
end
