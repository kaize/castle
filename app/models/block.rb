class Block < ActiveRecord::Base
  include BlockRepository

  attr_accessible :body, :on_main, :order_at, :state_event, :title

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
