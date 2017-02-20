class VideosController < ApplicationController
  before_action :require_user

  def index
    @categories = Category.all
  end

  def show
    @video = Video.find(params[:id])
    @reviews = @video.reviews
  end

  def search
    @videos = Video.search_by_title(params[:search])
  end

  def video_params
    params.require(:video).permit(:title, :descrption, :large_cover, :small_cover)
  end
end