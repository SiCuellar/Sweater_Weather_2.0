require 'rails_helper'

describe GoogleMapsService do
  it " Gets JSON data" do
    VCR.use_cassette("google_map_data_1") do

    location = "denver,co"
    service = GoogleMapsService.new
    coordinates = service.get_coordinates(location)

    expect(service).to be_an_instance_of(GoogleMapsService)
    expect(coordinates).to eq({:lat=>39.7392358, :lng=>-104.990251})
    end
  end
end
