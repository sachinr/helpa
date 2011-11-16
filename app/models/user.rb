class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :profile_answers, :as => :answerable
  has_many :projects
  has_many :project_user_scores, :dependent => :destroy

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :region, :admin

  after_save :update_project_user_score

  def update_profile_answers(scores)
    ProfileQuestion.all.each do |question|
      answer = self.profile_answers.
        find_or_create_by_answerable_id_and_profile_question_id(self.id, question.id)
      answer.score = scores[question.id.to_s].to_i
      answer.answerable_type = 'User'
      return false unless answer.save!
    end
    self.save
    return true
  end

  private

  def update_project_user_score
    ProjectUserScore.update_user_project_scores(self)
  end
end
