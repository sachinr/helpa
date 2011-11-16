class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :profile_answers, :as => :answerable
  has_many :projects

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :region, :admin

  def update_profile_answers(scores)
    ProfileQuestion.all.each do |question|
      answer = self.profile_answers.
        find_or_create_by_answerable_id_and_profile_question_id(self.id, question.id)
      answer.score = scores[question.id.to_s].to_i
      answer.answerable_type = 'User'
      return false unless answer.save!
    end
    return true
  end
end
