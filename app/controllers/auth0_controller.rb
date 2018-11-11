class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    session[:userinfo] = request.env['omniauth.auth']
    user_info = request.env['omniauth.auth'].extra.raw_info.to_h.symbolize_keys
    user = User.create_with(user_info.slice(:name, :given_name, :family_name, :picture)).find_or_create_by!(user_info.slice(:email))
    session[:user] = user.id

    # Redirect to the URL you want after successful auth
    unless user.filled_out_profile?
      redirect_to edit_user_path(user.id) and return
    end

    redirect_to root_path
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end
end
