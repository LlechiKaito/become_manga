class WorksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
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
    params.require(:work).permit(:main_title, :image, :explanation, :category_id).merge(user_id: current_user.id)
  end
end
