require 'rails_helper'

describe 'DayWeather' do
  it "it can return current weather for a specific day" do
    day_data = {:time=>1550991600,
                 :summary=>"Snow",
                 :icon=>"partly-cloudy-day",
                 :sunriseTime=>1551015700,
                 :sunsetTime=>1551055652,
                 :moonPhase=>0.69,
                 :precipIntensity=>0.0001,
                 :precipIntensityMax=>0.001,
                 :precipIntensityMaxTime=>1551070800,
                 :precipProbability=>0.11,
                 :precipAccumulation=>0.015,
                 :precipType=>"snow",
                 :temperatureHigh=>44.53,
                 :temperatureHighTime=>1551049200,
                 :temperatureLow=>19.12,
                 :temperatureLowTime=>1551099600,
                 :apparentTemperatureHigh=>40.66,
                 :apparentTemperatureHighTime=>1551049200,
                 :apparentTemperatureLow=>11.81,
                 :apparentTemperatureLowTime=>1551099600,
                 :dewPoint=>9.74,
                 :humidity=>0.39,
                 :pressure=>1020.33,
                 :windSpeed=>4.82,
                 :windGust=>11.72,
                 :windGustTime=>1551045600,
                 :windBearing=>128,
                 :cloudCover=>0.19,
                 :uvIndex=>4,
                 :uvIndexTime=>1551034800,
                 :visibility=>9.1,
                 :ozone=>311.08,
                 :temperatureMin=>21.28,
                 :temperatureMinTime=>1551016800,
                 :temperatureMax=>44.53,
                 :temperatureMaxTime=>1551049200,
                 :apparentTemperatureMin=>13.76,
                 :apparentTemperatureMinTime=>1551016800,
                 :apparentTemperatureMax=>40.66,
                 :apparentTemperatureMaxTime=>1551049200}
    day_weather = DayWeather.new(day_data)


    expect(day_weather).to be_an_instance_of(DayWeather)
    expect(day_weather.time).to eq(1550991600)
    expect(day_weather.summary).to eq("Snow")
    expect(day_weather.precip).to eq(0.11)
    expect(day_weather.temp_high).to eq(44.53)
    expect(day_weather.temp_low).to eq(19.12)
  end
end
