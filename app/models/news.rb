class News < ActiveRecord::Base
  include NewsRepository

  attr_accessible :body, :published_at, :state, :title, :state_event

  has_many :photos

  validates :title, presence: true
  validates :body, presence: true


  state_machine :state, initial: :hidden do
    state :hidden
    state :published

    event :publish do
      transition :hidden => :published
    end

    event :hide do
      transition all => :hidden
    end
  end

  def to_s
    title
  end
end
