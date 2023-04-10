class UsersController < ApplicationController

  def show
    #activehashのN+1問題の後に解決求む
    @works = Work.includes(:user).where(user_id: params[:id])
    @user = User.find(params[:id])
  end
end
