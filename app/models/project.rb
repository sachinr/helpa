class Project < ActiveRecord::Base
  belongs_to :organization
  has_many :profile_answers, :as => :answerable
  has_many :project_user_scores, :dependent => :destroy

  attr_accessible :name, :description, :equipment,
    :start_date, :end_date, :organization, :profile_answers_attributes

  validates_presence_of :name, :description,
    :start_date, :end_date, :organization

  accepts_nested_attributes_for :profile_answers, :allow_destroy => true

  after_save :update_project_user_score

  def update_answers(questions)
    existing_questions = self.profile_answers.map { |pa| pa.profile_question_id.to_s }
    (questions-existing_questions).each do |question_id|
      answer = ProfileAnswer.new(:profile_question_id => question_id,
                                 :answerable_id => self.id,
                                 :answerable_type => 'Project',
                                 :score => 1)
      return false unless answer.save!
    end

    (existing_questions-questions).each do |question_id|
      return false unless self.profile_answers.
        find_by_profile_question_id(question_id).delete
    end

    return true
  end

  private

  def update_project_user_score
    ProjectUserScore.update_project_users_scores(self)
  end

end

