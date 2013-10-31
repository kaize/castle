module PhotoAlbumRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
    state_machine.states.each do |s|
      scope s.name, -> { where(state: s.name) }
    end

    def sorted_photos
      photos.by_main
    end
  end
end
