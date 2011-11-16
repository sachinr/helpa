class ProjectsController < ApplicationController
  before_filter :authenticate_organization!

  def index
    @projects = current_organization.projects.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def new
    @project = Project.new
    @profile_questions = ProfileQuestion.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  def edit
    @profile_questions = ProfileQuestion.all
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    @project.organization = current_organization
    respond_to do |format|
      if @project.save && @project.update_answers(params[:question_id].flatten.uniq)
        format.html { redirect_to projects_path,
                      notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html {  @profile_questions = ProfileQuestion.all; render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update_attributes(params[:project]) && @project.update_answers(params[:question_id].flatten.uniq)
        format.html { redirect_to edit_project_path(@project),
                      notice: 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :ok }
    end
  end
end
