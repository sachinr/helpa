class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_admin
    unless current_user && current_user.admin
      flash[:error] = 'You need to be an admin to access that page'
      redirect_to root_path

    end
  end
end
