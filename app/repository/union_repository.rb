module UnionRepository
  extend ActiveSupport::Concern
  include BaseRepository
  include PgSearch

  included do
    multisearchable against: [:name, :description]
  end
end
