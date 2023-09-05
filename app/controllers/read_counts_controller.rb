class ReadCountsController < ApplicationController

  def create
    @comic = Comic.find(params[:comic_id])
    read_counts = ReadCount.create(read_count_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def read_counts_params
    params.require(:read_count).merge(user_id: @comic.user[:id], comic_id: @comic[:id])
  end

end
