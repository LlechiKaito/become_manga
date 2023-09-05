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
      @work = Work.find(params[:id])
      if @work[:evaluation].nil?
        @work[:evaluation] = 0
      end
      @work[:evaluation] += 10
      @work.save
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # 消す予定のブックマークのidを送ってもらう予定
    @book_mark = BookMark.find(params[:id])
    # saveと挙動はほぼ同じ
    unless @book_mark.nil?
      @work = Work.find(@book_mark.work_id)
      @book_mark.destroy
      if @work[:evaluation].nil?
        @work[:evaluation] = 0
      else
        @work[:evaluation] -= 10
      end
      @work.save
    end
    redirect_back(fallback_location: root_path)
  end

end
