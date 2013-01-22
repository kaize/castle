class News < ActiveRecord::Base
  include NewsRepository

  attr_accessible :body, :published_at, :state, :title, :state_event

  has_many :photos

  validates :title, presence: true
  validates :body, presence: true

  state_machine :state, initial: :hided do
    state :hided
    state :published

    event :publish do
      transition :hided => :published
    end

    event :hide do
      transition all => :hided
    end
  end

  def to_s
    title
  end
end
