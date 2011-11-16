class ProfileAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :profile_question

  validates_uniqueness_of :profile_question_id, :scope => [:user_id]
  validates_presence_of :score, :user, :profile_question

  attr_accessible :score, :user, :profile_question
end
