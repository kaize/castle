module PageRepository
  extend ActiveSupport::Concern
  include BaseRepository
  include PgSearch
  
  included do
    multisearchable against: [:title, :body], if: :published?
    
    scope :published, where(state: 'published')
    scope :web, published.asc_by_order_at
  end
end
