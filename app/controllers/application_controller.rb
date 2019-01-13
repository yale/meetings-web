class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def restrict_access
    unless logged_in?
      session[:redirect_to] = request.fullpath
      redirect_to '/auth/auth0' 
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user])
  end

  def logged_in?
    current_user != nil
  end

  protected

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
end
