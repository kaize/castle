module PhotoAlbum::PhotoRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
    scope :master, -> { where(main: true) }
  end
end