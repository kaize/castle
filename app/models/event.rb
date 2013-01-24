class Event < ActiveRecord::Base
  attr_accessible :begin_date, :content, :end_date, :image, :name, :main
  validates :name, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true
  validates :content, presence: true

  mount_uploader :image, EventImageUploader

  def start_time
    begin_date
  end
end
