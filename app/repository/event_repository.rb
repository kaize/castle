module EventRepository
  extend ActiveSupport::Concern
  include BaseRepository
  include PgSearch

  included do
    multisearchable against: [:name, :content]
  end
end

