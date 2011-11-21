class DashboardController < ApplicationController
  def show
    unless user_signed_in? || organization_signed_in?
      redirect_to root_path
    else
      if current_user && !current_user.admin
        prepare_user_dashboard
      elsif current_organization
        prepare_org_dashboard
      end
    end
  end

  private

  def prepare_user_dashboard
    @upcoming_suggestions = current_user.upcoming_suggested_projects.limit(4)
    @projects = Project.order('created_at DESC').limit(3)
    @upcoming_attending_projects = current_user.upcoming_attending_projects.limit(4)
  end

  def prepare_org_dashboard
    @unapproved_volunteers = Attendee.joins(:project).where("organization_id = #{current_organization.id} AND accepted = 'FALSE' OR accepted IS NULL")
  end

end
