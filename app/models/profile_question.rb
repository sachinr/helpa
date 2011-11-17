class ProfileQuestion < ActiveRecord::Base
  attr_accessible :short_display, :long_display

  has_many :profile_answers, :dependent => :destroy
end
