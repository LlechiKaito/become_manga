class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_judge, only: [:edit, :update]

  def show
    #activehashのN+1問題の後に解決求む
    @works = Work.includes(:user).where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update_without_password(user_params)
      redirect_to root_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile, :image)
  end

  def user_judge
    if params[:id] == current_user[:id].to_s
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end
  
end
