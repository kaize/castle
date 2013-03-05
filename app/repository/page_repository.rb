module PageRepository
  extend ActiveSupport::Concern
  include BaseRepository
  
  included do
    scope :published, where(state: :published)
    scope :web, published
  end
end
