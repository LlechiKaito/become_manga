class BookMarksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    #プルダウンメニューにソート中のカテゴリーを表示するようの変数.初回は値が入っていないので'---'を表示
    @selected = params[:category_id] || Category.find(1)

    #漫画をソートして@worksに格納.'---'の場合全てを表示.初回用にnil判定.
    if current_user.nil?
      redirect_to root_path()
    else
      @book_marks = current_user.book_marks.includes(:work).page(params[:page])
    end

    #プルダウンにカテゴリー一覧を表示する用の変数.
    @category = Category.all
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
