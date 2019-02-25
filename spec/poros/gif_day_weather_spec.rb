require 'rails_helper'

describe 'GifDayWeather' do
  it "it can return gif url " do
    day_data = {:time=>1550991600,
                 :summary=>"Snow",
                }
    day_weather = GifDayWeather.new(day_data)


    expect(day_weather).to be_an_instance_of(GifDayWeather)
    expect(day_weather.time).to eq(1550991600)
    expect(day_weather.summary).to eq("Snow")
    expect(day_weather.gif_url).to include("https://giphy.com/gifs")
  end
end
