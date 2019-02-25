require 'rails_helper'

describe 'giphy weather maker' do
  it "can make days with gifs in each one" do
    location = "Denver, CO"
    g_weather_maker = GiphyWeatherMaker.new(location)

    expect(g_weather_maker).to be_an_instance_of(GiphyWeatherMaker)
    expect(g_weather_maker.daily_gif).to be_a(Array)
  end
end
