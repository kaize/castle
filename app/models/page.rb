class Page < ActiveRecord::Base
  attr_accessible :body, :title, :uri

  validates :title, presence: true
  validates :body, presence: true
  validates :uri, presence: true, slug: true, uniqueness: true

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

  def to_param
    uri
  end
end
