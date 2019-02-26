require 'rails_helper'

describe "darksky service" do
  it "can return weather data for a specfic city " do
    VCR.use_cassette("fav_data_3") do

      city_forecast = DarkskyService.new.get_forcast(39.7392358, -104.990251)

      expect(city_forecast).to be_a(Hash)
      expect(city_forecast).to have_key(:currently)
      expect(city_forecast).to have_key(:hourly)
      expect(city_forecast).to have_key(:daily)
    end
  end
end
