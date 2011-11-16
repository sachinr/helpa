class ProjectUserScore < ActiveRecord::Base
  belongs_to :user
  belongs_to :project


  def self.update_user_project_scores(user)
    Project.all.each do |project|
      self.calculate_project_user_score(project, user)
    end
  end

  def self.update_project_users_scores(project)
    User.all.each do |user|
      self.calculate_project_user_score(project, user)
    end
  end

  def self.calculate_project_user_score(project, user)
    su = self.find_or_create_by_project_id_and_user_id(project.id, user.id)
    total_score = 0
    project.profile_answers.each do |project_answer|
      user_answer = user.profile_answers.
        find_by_profile_question_id(project_answer.profile_question_id)
      total_score += user_answer.score if user_answer
    end
    su.score = total_score
    su.save
  end

end
