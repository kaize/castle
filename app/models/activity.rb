class Activity < ActiveRecord::Base
  attr_accessible :name, :page_activity
 
  has_many :page_activities
  validates :name, presence: true
 
  def to_s
    name
  end
end
