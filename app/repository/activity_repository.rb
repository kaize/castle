module ActivityRepository
  extend ActiveSupport::Concern
  include BaseRepository
  include PgSearch

  included do
    multisearchable against: [:name, :page_activity]
  end
end
