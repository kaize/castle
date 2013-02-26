module InstructorRepository
  extend ActiveSupport::Concern
  include BaseRepository
  include PgSearch

  included do
    multisearchable against: [:first_name, :middle_name, :last_name, :description]
  end
end
