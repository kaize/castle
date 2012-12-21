class UnionType < Union
  include BaseType

  attr_accessible :photos_attributes, :instructor_ids

  accepts_nested_attributes_for :photos, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :instructors, :reject_if => :all_blank, :allow_destroy => true

end
