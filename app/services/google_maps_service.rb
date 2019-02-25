class GoogleMapsService
  def get_coordinates(location)
    get_json("/maps/api/geocode/json?address=#{location}&key=#{ENV["GOOGLE_MAPS_KEY"]}")[:results][0][:geometry][:location]
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    @conn = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
