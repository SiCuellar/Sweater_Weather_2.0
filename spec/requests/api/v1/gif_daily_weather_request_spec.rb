require 'rails_helper'

describe "gif daily weather" do
  it "returns days with gif url for each day based on summary" do
    VCR.use_cassette("gif_daily_weather_2") do

      get '/api/v1/gifs?location=denver,co'

      weather_data = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:gif_daily_weather]

      expect(weather_data).to be_a(Array)

      weather_data.each do |day|
        expect(day).to have_key(:time)
        expect(day).to have_key(:gif_url)
        expect(day).to have_key(:summary)
      end
    end
  end
end
