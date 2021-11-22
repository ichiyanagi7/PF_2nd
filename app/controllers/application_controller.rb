class ApplicationController < ActionController::Base
  def require_user_signed_in
    unless signed_in?
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    !!current_user
  end

end
