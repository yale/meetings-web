class UsersController < ApplicationController
  before_action :restrict_access
  before_action :find_user
  before_action :require_user_to_be_logged_in_user
   
  def edit
  end

  def update
    first_time = !@user.filled_out_profile?

    @user.update!(update_user_params)

    if first_time
      redirect_to session[:redirect_to] || root_path
    else
      redirect_to root_path
    end
  end

  private

  def update_user_params
    params.require(:user).permit(:company_name)
  end

  def find_user
    if params[:id] == 'me'
      @user = current_user
    else
      @user = User.find(params.require(:id))
    end
  end

  def require_user_to_be_logged_in_user
    if @user.id != session[:user]
      redirect_to root_path
    end
  end
end
