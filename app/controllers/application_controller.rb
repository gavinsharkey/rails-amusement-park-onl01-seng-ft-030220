class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?
  helper_method :admin?
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def admin?
    current_user.admin
  end

  def logged_in?
    !!current_user
  end

  def redirect_if_logged_in
    redirect_to user_path(current_user) if logged_in?
  end

  def redirect_if_not_logged_in
    redirect_to root_path if !logged_in?
  end
end
