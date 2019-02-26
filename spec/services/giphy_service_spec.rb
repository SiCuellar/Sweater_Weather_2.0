require 'rails_helper'

describe "Giphy Service" do
  it " it can return an gif " do
    VCR.use_cassette("fav_data_0") do

      summary = "Cloudy"
      service = GiphyService.new
      gif_url = service.get_gif(summary)

      expect(service).to be_an_instance_of(GiphyService)
      expect(gif_url).to include("https://giphy.com")
    end
  end
end
