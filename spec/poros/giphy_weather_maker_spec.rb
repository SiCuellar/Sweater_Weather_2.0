require 'rails_helper'

describe 'giphy weather maker' do
  it "can make days with gifs in each one" do
    VCR.use_cassette("weather_maker_1") do

      location = "Denver, CO"
      g_weather_maker = GiphyWeatherMaker.new(location)

      expect(g_weather_maker).to be_an_instance_of(GiphyWeatherMaker)
      expect(g_weather_maker.gif_daily_weather).to be_a(Array)

      g_weather_maker.gif_daily_weather.each do |gif_day|
        expect(gif_day.gif_url).to include("https://giphy.com")
      end
    end
  end
end
