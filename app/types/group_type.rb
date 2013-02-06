class GroupType < Group
  include BaseType

  attr_accessible :schedules_attributes
  
  accepts_nested_attributes_for :schedules, :reject_if => :all_blank, :allow_destroy => true
end
