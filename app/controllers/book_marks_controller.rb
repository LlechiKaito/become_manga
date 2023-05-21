class BookMarksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    # ログインしているuserのブックマークを抽出
    @book_marks = BookMark.where("user_id = ?", current_user[:id])
    # ブックマークと関連するworkをarrayに格納
    @works = []
    @book_marks.each do |book_mark|
      @works.push(Work.find(book_mark.work_id))
    end
  end

  def create
    unless BookMark.find_by(user_id: current_user[:id], work_id: params[:id])
      BookMark.create(user_id: current_user[:id], work_id: params[:id])
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # 消す予定のブックマークのidを送ってもらう予定
    @bookmark = BookMark.find(params[:id])
    # saveと挙動はほぼ同じ
    @bookmark.destroy
    redirect_back(fallback_location: root_path)
  end

end
