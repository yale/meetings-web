class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def restrict_access
    redirect_to '/' unless logged_in?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user])
  end

  def logged_in?
    current_user != nil
  end
end
