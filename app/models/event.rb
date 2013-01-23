class Event < ActiveRecord::Base
  attr_accessible :begin_date, :content, :end_date, :image, :name
  validates :name, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true
  validates :content, presence: true

  mount_uploader :image, EventImageUploader
end
