class ActivityType < Activity
  include BaseType

  attr_accessible :page_activities_attributes

  accepts_nested_attributes_for :page_activities, :reject_if => :all_blank, :allow_destroy => true

end
