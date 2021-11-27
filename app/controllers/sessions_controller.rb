class SessionsController < ApplicationController
  skip_before_action :require_sign_in!, only: [:new, :create]
  before_action :set_user, only: [:create]

  def new
  end

  def create
    if @user.authenticate(session_params[:password])
      sign_in(@user)
      redirect_to root_path,notice: "ログインに成功しました。"
    else
      redirect_to login_path, notice: "ログインできませんでした。"
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end

  private

  def set_user
    @user = User.find_by!(email: session_params[:email])
  rescue
    flash.now[:danger] = "ユーザーが見つかりません。"
    render :new
  end

  # 許可するパラメータ
  def session_params
    params.require(:session).permit(:email, :password)
  end

end
