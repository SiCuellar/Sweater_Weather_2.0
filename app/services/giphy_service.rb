class GiphyService

  def get_gif(summary)
    if summary.nil? || summary.empty?
      # binding.pry
      "https://media.giphy.com/media/dZCBzEPwAi9WNM3Oo9/giphy.gif"
    else
      get_json("search?q=#{summary}&api_key=#{ENV["GIPHY_KEY"]}&limit=1")[:data][0][:url]
    end
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    @conn = Faraday.new(url: "http://api.giphy.com/v1/gifs/") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
