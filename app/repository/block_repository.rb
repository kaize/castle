module BlockRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
    scope :published, where{state.eq 'published'}
    scope :web, published.asc_by_order_at
  end
end
