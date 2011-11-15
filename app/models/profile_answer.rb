class ProfileAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :profile_question

end
