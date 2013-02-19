class Activity::PageActivity < ActiveRecord::Base
  attr_accessible :body, :name
  
  define_index do
    indexes :name
    indexes :body
    
    has created_at
  end
  
  validates :body, presence: true
  validates :name, presence: true
  
  belongs_to :activity, inverse_of: :page_activities
  
  def to_s
    name
  end
end
