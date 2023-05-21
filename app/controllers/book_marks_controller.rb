class BookMarksController < ApplicationController

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
    # paramsは、workのidを送ってもらうようにする
    @bookmark = BookMark.new(user_id: current_user[:id], work_id: params[:id])
    # saveが成功したら知らせが出る backは、createを申請したページに再読み込みして戻ります。
    if @bookmark.save
      #エラーが出た、redirect_to :backは非推奨らしい
      #下に変更したらエラー解消、俺の実装が悪い可能性有り
      #redirect_to :back, notice: "Bookmark was successfully created."
      redirect_back(fallback_location: root_path)
    # saveが失敗したら警告が出る
    else
      redirect_to :back, alert: "Error occurred while bookmarking."
    end
  end

  def destroy
    # 消す予定のブックマークのidを送ってもらう予定
    @book_mark = BookMark.find(params[:id])
    # saveと挙動はほぼ同じ
    if @bookmark.destroy
      redirect_to :back, notice: "Bookmark was successfully deleted."
    else
      redirect_to :back, alert: "Error occurred while deleting bookmark."
    end
  end

end
