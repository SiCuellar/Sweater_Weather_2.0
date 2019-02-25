require 'rails_helper'

describe "Giphy Service" do
  it " it can return an gif " do
    summary = "Cloudy"
    service = GiphyService.new
    gif_url = service.get_gif(summary)

    expect(service).to be_an_instance_of(GiphyService)
    expect(gif_url).to include("https://giphy.com")
  end

  it " it can return an gif if summary is empty " do
    summary = ""
    service = GiphyService.new
    gif_url = service.get_gif(summary)

    expect(service).to be_an_instance_of(GiphyService)
    #if url is empty, this gid is specified to return"
    expect(gif_url).to include("https://media.giphy.com/media/dZCBzEPwAi9WNM3Oo9/giphy.gif")
  end

  it " it can return an gif if summary is nil" do
    summary = nil
    service = GiphyService.new
    gif_url = service.get_gif(summary)

    expect(service).to be_an_instance_of(GiphyService)
    #if url is empty, this gid is specified to return"
    expect(gif_url).to include("https://media.giphy.com/media/dZCBzEPwAi9WNM3Oo9/giphy.gif")
  end
end
