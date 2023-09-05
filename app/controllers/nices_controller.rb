class NicesController < ApplicationController

  def index
    # ログインしているuserのブックマークを抽出
    @nices = Nice.where("user_id = ?", current_user[:id])
    # ブックマークと関連するworkをarrayに格納
    @comics = []
    @nices.each do |nice|
      @comics.push(Comic.find(nice.comic_id))
    end
  end

  def create
    unless Nice.find_by(user_id: current_user[:id], comic_id: params[:id])
      Nice.create(user_id: current_user[:id], comic_id: params[:id])
      @comic = Comic.find(params[:id])
      @work = Work.find(@comic.work_id)
      if @work[:evaluation].nil?
        @work[:evaluation] = 0
      end
      @work[:evaluation] += 1
      @work.save
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # 消す予定のブックマークのidを送ってもらう予定
    @nice = Nice.find(params[:id])
    # saveと挙動はほぼ同じ
    unless @nice.nil?
      @work = Work.find(@nice.comic.work_id)
      @nice.destroy
      if @work[:evaluation].nil?
        @work[:evaluation] = 0
      else
        @work[:evaluation] -= 1
      end
      @work.save
    end
    redirect_back(fallback_location: root_path)
  end
end
