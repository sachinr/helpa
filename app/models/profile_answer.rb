class ProfileAnswer < ActiveRecord::Base
  belongs_to :answerable, :polymorphic => true
  belongs_to :profile_question

  validates_uniqueness_of :profile_question_id, :scope => [:answerable_id, :answerable_type]
  validates_presence_of :score, :answerable_id, :profile_question_id

  attr_accessible :score, :answerable, :profile_question, :answerable_id, :answerable_type, :profile_question_id

end
