class Activity::PageActivity < ActiveRecord::Base
  include Activity::PageActivityRepository

  attr_accessible :body, :name

  belongs_to :activity, inverse_of: :page_activities

  validates :body, presence: true
  validates :name, presence: true
  validates :activity, presence: true

  def to_s
    name
  end
end
