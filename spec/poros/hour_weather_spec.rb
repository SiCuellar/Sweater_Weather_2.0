require 'rails_helper'

describe 'Current Weather' do
  it "it can return current weather for a specific day" do
    hour_data = {:time=>1551074400,
                 :summary=>"Clear",
                 :icon=>"clear-night",
                 :precipIntensity=>0,
                 :precipProbability=>0,
                 :temperature=>29.59,
                 :apparentTemperature=>29.59,
                 :dewPoint=>15.89,
                 :humidity=>0.56,
                 :pressure=>1015.27,
                 :windSpeed=>2.55,
                 :windGust=>3.23,
                 :windBearing=>165,
                 :cloudCover=>0,
                 :uvIndex=>0,
                 :visibility=>7.43,
                 :ozone=>304.59}

    hour_weather = HourWeather.new(hour_data)

    expect(hour_weather).to be_an_instance_of(HourWeather)
    expect(hour_weather.time).to eq(1551074400)
    expect(hour_weather.summary).to eq("Clear")
    expect(hour_weather.precip).to eq(0)
    expect(hour_weather.icon).to eq("clear-night")
    expect(hour_weather.temp).to eq(29.59)
  end
end
