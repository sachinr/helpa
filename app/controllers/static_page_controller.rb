class StaticPageController < ApplicationController
  def index
    if current_user || current_organization
      redirect_to dashboard_path
    else
      respond_to do |format|
        format.html # index.html.erb
      end
    end
  end
end
