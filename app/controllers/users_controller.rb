class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_judge, only: [:edit, :update]

  def show
    #activehashのN+1問題の後に解決求む
    @works = Work.includes(:user).where(user_id: params[:id]).page(params[:page])
    @user = User.find(params[:id])
  end

  def edit
    
  end

  def update
    pattern = /^data:image\/(png|jpeg|jpg|gif);base64,([A-Za-z0-9+\/]+={0,2})$/
    if pattern =~ params[:user][:image]
      base64_data = params[:user][:image] # POSTリクエストからBase64データを受け取る
      base64_data = base64_data.split(',')[1] # ヘッダーを削除してBase64データのみを取得
      binary_data = Base64.decode64(base64_data)
      @user.image.attach(io: StringIO.new(binary_data), filename: 'user_image.png', content_type: 'image/png')
      if @user.update_without_password(user_params)
        redirect_to user_path(current_user.id), notice: 'User was successfully updated.'
      else
        render :edit
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile)
  end

  def user_judge
    if params[:id] == current_user[:id].to_s
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end
  
end
