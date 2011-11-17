class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def show
    @project = Project.find(params[:id])
    @attendee = Attendee.
      find_by_project_id_and_user_id(@project.id, current_user.id)
  end


  def attend
    attendee = Attendee.new(:user_id => current_user.id,
                            :project_id => params[:id])
    if attendee.save
      respond_to do |format|
        format.html { redirect_to request.referer }
      end
    end
  end

  def destroy_attendee
    @attendee =  Attendee.
      find_by_project_id_and_user_id(params[:id], current_user.id)
    @attendee.destroy
    respond_to do |format|
      format.html { redirect_to request.referer }
    end
  end

end
