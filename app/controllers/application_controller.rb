class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= session[:user_id] && User.friendly.find_by_id(session[:user_id])
  end
  helper_method :current_user

end
