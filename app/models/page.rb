class Page < ActiveRecord::Base
  include PageRepository

  attr_accessible :body, :title, :state_event, :order_at

  belongs_to :menu_item

  validates :title, presence: true
  validates :body, presence: true
  validates :menu_item, presence: true

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
