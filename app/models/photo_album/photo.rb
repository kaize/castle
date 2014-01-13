class PhotoAlbum::Photo < ActiveRecord::Base
  include PhotoAlbum::PhotoRepository
  attr_accessible :image, :name, :photo_album_id, :description, :main

  belongs_to :photo_album, counter_cache: true

  mount_uploader :image, PhotoAlbum::PhotoUploader

  validates :image, presence: true

  def information?
    self.name? || self.description?
  end
end