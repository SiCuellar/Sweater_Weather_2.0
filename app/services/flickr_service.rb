class FlickrService

  def get_city_backround(location)
    get_json("?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=#{ENV['FLICKR_KEY']}&tags=#{location}")[:photos][:photo].sample
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    @conn = Faraday.new(url: "https://api.flickr.com/services/rest/") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
