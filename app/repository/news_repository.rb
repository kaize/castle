module NewsRepository
  extend ActiveSupport::Concern
  include BaseRepository
  include PgSearch

  included do
    multisearchable against: [:title, :body], if: :published?

    scope :published, where{state.eq 'published'}
    scope :web, published.by_published_at
  end
end
