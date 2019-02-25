class Api::V1::BackgroundController < ApplicationController

  def show
    render json: BackgroundSerializer.new(BackgroundMaker.new(params[:location]))
  end
end
