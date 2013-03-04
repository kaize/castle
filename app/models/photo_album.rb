class PhotoAlbum < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :name, :state, :description, :main

  validates :name, :presence => true
  
  has_many :events
  has_many :photos, :dependent => :destroy

  before_save do
    if main?
      PhotoAlbum.update_all main: true, main: false
    end
  end

  state_machine :state, :initial => :unpublished do
    state :published
    state :unpublished

    event :publish do
      transition :unpublished => :published
    end

    event :unpublish do
      transition :published => :unpublished
    end
  end

  scope :published, with_state(:published)

  class << self
    def welcome_album
      published.random.first
    end
  end

  def can_view?
    photos.any?
  end
end
