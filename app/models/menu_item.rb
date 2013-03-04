class MenuItem < ActiveRecord::Base
  attr_accessible :title

  has_ancestry
end
