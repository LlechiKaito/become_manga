class WorksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    #プルダウンメニューにソート中のカテゴリーを表示するようの変数.初回は値が入っていないので'---'を表示
    @selected = params[:category_id] || Category.find(1)

    #漫画をソートして@worksに格納.'---'の場合全てを表示.初回用にnil判定.
    if current_user.nil?
      @works = Work.page(params[:page])
    else
      if params[:category_id] == "1" || params[:category_id].nil? 
        @works = Work.where(user_id: current_user.id).order(evaluation: :desc).page(params[:page])
      else  
        @works = Work.where("category_id = ? ", params[:category_id]).order(evaluation: :desc).page(params[:page])
      end
    end

    #プルダウンにカテゴリー一覧を表示する用の変数.
    @category = Category.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  private

  def work_params
    # カラムの追加を行なった！確認よろ！
    params.require(:work).permit(:main_title, :image, :explanation, :category_id).merge(user_id: current_user.id, evaluation: 0)
  end
end
