class Project < ActiveRecord::Base
  belongs_to :organization

  attr_accessible :name, :description, :equipment,
    :start_date, :end_date, :organization

  validates_presence_of :name, :description,
    :start_date, :end_date, :organization
end

