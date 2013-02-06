class Group::Schedule::Classroom < ActiveRecord::Base
  include Group::Schedule::ClassroomRepository
  
  attr_accessible :name

  has_many :group_schedules

  validates :name, presence: true
end
