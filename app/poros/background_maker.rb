class BackgroundMaker
  attr_reader :location, :flickr_data, :url

  def initialize(location)
    @location = location
    @flickr_data = FlickrService.new.get_city_backround(location)
  end

  def url
    url = "https://farm#{@flickr_data[:farm]}.staticflickr.com/#{@flickr_data[:server]}/#{@flickr_data[:id]}_#{@flickr_data[:secret]}.jpg"
  end
end
