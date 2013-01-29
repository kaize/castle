class Activity::PageActivity < ActiveRecord::Base
  attr_accessible :body, :name

  validates :body, presence: true
  validates :name, presence: true
  
  belongs_to :activity, inverse_of: :page_activities

end
