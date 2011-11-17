class DashboardController < ApplicationController
  def show
    unless user_signed_in? || organization_signed_in?
      redirect_to root_path
    else
      if current_user && !current_user.admin
        date_today = DateTime.now.strftime('%Y-%m-%d')
        @project_user_scores = current_user.project_user_scores.joins('JOIN projects ON project_id').
          group('project_id').order('score DESC').
          where("projects.end_date >= #{date_today}").limit(4)
        @projects = Project.order('created_at DESC').limit(3)
        @upcoming_projects = current_user.projects.where("start_date >= #{date_today}").
          order('start_date ASC').limit(4)
      end
    end
  end
end
