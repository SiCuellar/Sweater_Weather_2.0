class Api::V1::GifController < ApplicationController

  def index
    render json: GifSerializer.new(GiphyWeatherMaker.new(params[:location]))
  end
end
