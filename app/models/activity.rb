class Activity < ActiveRecord::Base
  include ActivityRepository

  attr_accessible :name, :page_activity
 
  has_many :page_activities, dependent: :destroy
  validates :name, presence: true
 
  def to_s
    name
  end
end
