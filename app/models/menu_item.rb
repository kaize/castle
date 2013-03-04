class MenuItem < ActiveRecord::Base
  include MenuItemRepository

  attr_accessible :title, :parent_id

  has_many :pages

  has_ancestry
end
