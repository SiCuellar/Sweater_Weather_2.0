require 'rails_helper'

describe 'flickr servive' do
  it "returns image based on location" do
    city_backround_image = FlickrService.new.get_city_backround("denver, co")

    expect(city_backround_image).to have_key(:id)
    expect(city_backround_image).to have_key(:owner)
    expect(city_backround_image).to have_key(:secret)
    expect(city_backround_image).to have_key(:server)
    expect(city_backround_image).to have_key(:farm)
    expect(city_backround_image).to have_key(:title)
    expect(city_backround_image).to have_key(:ispublic)
    expect(city_backround_image).to have_key(:isfriend)
    expect(city_backround_image).to have_key(:isfamily)
  end
end
