class ProjectUserScoresController < ApplicationController
  before_filter :authenticate_user!, :only => [:suggested_projects]
  before_filter :authenticate_organization!, :only => [:suggested_volunteers]

  def suggested_projects
    @project_user_scores = ProjectUserScore.order('score DESC').
      find_all_by_user_id(current_user.id)
  end

  def suggested_volunteers
    @project_user_scores = ProjectUserScore.order('score DESC').
      find_all_by_project_id(params[:id])
  end

end
