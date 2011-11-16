class DashboardController < ApplicationController
  def show
    unless user_signed_in? || organization_signed_in?
      redirect_to root_path
    end
  end
end
