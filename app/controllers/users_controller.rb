class UsersController < ApplicationController
  skip_before_action :require_sign_in!, only: [:new, :create]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to root_path
    else
      @user = user
      render :new
    end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password_digest,:age)
  end
end
