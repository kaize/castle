class News::Photo < ActiveRecord::Base
  attr_accessible :asset, :news_id

  belongs_to :news

  mount_uploader :asset, NewsPhotoUploader
end
