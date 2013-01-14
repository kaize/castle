class PhotoAlbum < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :name, :state, :description

  has_many :photos, :dependent => :destroy

  state_machine :state, :initial => :new do
    state :new
    state :published

    event :publish do
      transition :new => :published
    end
  end

  scope :published, with_state(:published)

  validates :name, :presence => true

  class << self
    def welcome_album
      published.random.first
    end
  end
end
