class MenuItem < ActiveRecord::Base
  include MenuItemRepository

  attr_accessible :title, :parent_id
  
  validates :title, presence: true
  
  has_many :pages

  has_ancestry

end
