class Block < ActiveRecord::Base
  include BlockRepository

  attr_accessible :body, :on_main, :order_at, :state_event, :title

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
end
