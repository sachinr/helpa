class Admin::ProfileQuestionsController < ApplicationController

  before_filter :require_admin

  def index
    @profile_questions = ProfileQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profile_questions }
    end
  end

  def show
    @profile_question = ProfileQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile_question }
    end
  end

  def new
    @profile_question = ProfileQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile_question }
    end
  end

  def edit
    @profile_question = ProfileQuestion.find(params[:id])
  end

  def create
    @profile_question = ProfileQuestion.new(params[:profile_question])

    respond_to do |format|
      if @profile_question.save
        format.html { redirect_to admin_profile_questions_path, notice: 'Profile question was successfully created.' }
        format.json { render json: @profile_question, status: :created, location: @profile_question }
      else
        format.html { render action: "new" }
        format.json { render json: @profile_question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @profile_question = ProfileQuestion.find(params[:id])

    respond_to do |format|
      if @profile_question.update_attributes(params[:profile_question])
        format.html { redirect_to admin_profile_questions_path, notice: 'Profile question was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile_question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile_question = ProfileQuestion.find(params[:id])
    @profile_question.destroy

    respond_to do |format|
      format.html { redirect_to admin_profile_questions_url }
      format.json { head :ok }
    end
  end
end
