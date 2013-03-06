module MenuItemRepository
  extend ActiveSupport::Concern
  include BaseRepository

  module ClassMethods
    def published_arrange(depth)
      published = joins(:pages).where("pages.state LIKE 'published'").all
      ids = published.map{ |i| i.path_ids[0...depth] }.flatten.uniq
      where(id: ids).includes(:pages).arrange
    end
  end

  included do
  end
end
