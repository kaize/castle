module BlockRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
    state_machine.states.each do |s|
      scope s.name, -> { where(state: s.name) }
    end
    scope :web, published.asc_by_order_at
  end
end
