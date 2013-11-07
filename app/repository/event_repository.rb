module EventRepository
  extend ActiveSupport::Concern
  include BaseRepository
  include PgSearch

  included do
    multisearchable against: [:name, :content]
    scope :main, -> { where(main: true) }
  end
end

