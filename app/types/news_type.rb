class NewsType < News
  include BaseType

  attr_accessible :photos_attributes

  accepts_nested_attributes_for :photos, :reject_if => :all_blank, :allow_destroy => true

end
