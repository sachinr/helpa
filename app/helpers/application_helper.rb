module ApplicationHelper

  def project_compatibility(project_user_score)
    number_of_questions = ProfileQuestion.all.count
    high_score = number_of_questions * ProfileAnswer::HIGH_SCORE
    medium_score = number_of_questions * (ProfileAnswer::HIGH_SCORE/2)
    score = project_user_score.score

    if score == 0
      return 'Average'
    elsif score > 0 && score <= medium_score
      return 'Above average'
    elsif score <= high_score && score > medium_score
      return 'High'
    else
      return 'Not compatible'
    end
  end

end
