class Admin::ProfileQuestionsController < ApplicationController

  before_filter :require_admin
  # GET /admin/profile_questions
  # GET /admin/profile_questions.json
  def index
    @profile_questions = ProfileQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profile_questions }
    end
  end

  # GET /admin/profile_questions/1
  # GET /admin/profile_questions/1.json
  def show
    @profile_question = ProfileQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile_question }
    end
  end

  # GET /admin/profile_questions/new
  # GET /admin/profile_questions/new.json
  def new
    @profile_question = ProfileQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile_question }
    end
  end

  # GET /admin/profile_questions/1/edit
  def edit
    @profile_question = ProfileQuestion.find(params[:id])
  end

  # POST /admin/profile_questions
  # POST /admin/profile_questions.json
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

  # PUT /admin/profile_questions/1
  # PUT /admin/profile_questions/1.json
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

  # DELETE /admin/profile_questions/1
  # DELETE /admin/profile_questions/1.json
  def destroy
    @profile_question = ProfileQuestion.find(params[:id])
    @profile_question.destroy

    respond_to do |format|
      format.html { redirect_to admin_profile_questions_url }
      format.json { head :ok }
    end
  end
end
