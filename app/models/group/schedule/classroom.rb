class Group::Schedule::Classroom < ActiveRecord::Base
  include Group::Schedule::ClassroomRepository
  
  attr_accessible :name

  has_many :group_schedules
  accepts_nested_attributes_for :group_schedules, :reject_if => :all_blank, :allow_destroy => true
  
  validates :name, presence: true
  
  def can_destroy?
      persisted?
  end
  
  def to_s
    name
  end
  
end
