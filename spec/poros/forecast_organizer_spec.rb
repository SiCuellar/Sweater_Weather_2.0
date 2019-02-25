require 'rails_helper'

describe 'forecast organizer' do
  it "can organize all inforamtion needed for a forecaset page" do
    location = "Denver, CO"
    forecast_organizer = ForecastOrganizer.new(location)

    expect(forecast_organizer.current_weather).to be_an_instance_of(CurrentWeather)
    expect(forecast_organizer.current_weather).to be_an_instance_of(CurrentWeather)
  end

  it "#daily_weather" do
    location = "Denver, CO"
    forecast_organizer = ForecastOrganizer.new(location)

    expect(forecast_organizer.daily_weather).to be_a(Array)
    expect(forecast_organizer.daily_weather[0]).to be_an_instance_of(DayWeather)
    expect(forecast_organizer.daily_weather.count).to eq(7)
  end

  it "#hourly_weather" do
    location = "Denver, CO"
    forecast_organizer = ForecastOrganizer.new(location)

    expect(forecast_organizer.hourly_weather).to be_a(Array)
    expect(forecast_organizer.hourly_weather[0]).to be_an_instance_of(HourWeather)
    expect(forecast_organizer.hourly_weather.count).to eq(8)
  end
end
