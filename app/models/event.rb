class Event < ActiveRecord::Base
  include EventRepository
  
  attr_accessible :begin_date, :content, :end_date, :image, :name, :main, :photo_album_id
  
  belongs_to :photo_album

  validates :name, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true
  validates :content, presence: true

  mount_uploader :image, EventImageUploader

  before_save :hide_another_from_main

  def start_time
    begin_date
  end

  def to_s
    name
  end
  
private
  def hide_another_from_main
    if main?
      self.class.exclude(id).update_all main: true, main: false
    end
  end 
  
end
