class News < ActiveRecord::Base
  include NewsRepository

  attr_accessible :body, :published_at, :state, :title, :state_event

  has_many :photos

  validates :title, presence: true
  validates :body, presence: true

  state_machine :state, initial: :off do
    state :off
    state :published

    event :publish do
      transition :off => :published
    end

    event :off do
      transition all => :off
    end
  end

  def to_s
    title
  end
end
