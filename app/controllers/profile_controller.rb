class ProfileController < ApplicationController
  before_filter :authenticate_user!

  def show
    @profile_questions = ProfileQuestion.all
    @profile_anwers = current_user.profile_answers
  end

  def update
    if current_user.update_profile_answers(params['question_id'])
      flash[:notice] = 'Great Success!'
    else
      flash[:error] = 'Something went wrong!'
    end
    redirect_to :profile
  end
end

