class Page < ActiveRecord::Base
  attr_accessible :body, :title, :uri

  validates :title, presence: true
  validates :body, presence: true
  validates :uri, presence: true, slug: true, uniqueness: true

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

  def to_param
    uri
  end
end
