module Activity::PageActivityRepository
  extend ActiveSupport::Concern
  include BaseRepository
  include PgSearch

  included do
    multisearchable against: [:name, :body]
  end
end
