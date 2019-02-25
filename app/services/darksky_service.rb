class DarkskyService
  def get_forcast(lat,long)
    get_json("/forecast/#{ENV["DARK_SKY_KEY"]}/#{lat},#{long}")
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    @conn = Faraday.new(url: "https://api.darksky.net") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
