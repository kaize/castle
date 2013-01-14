class PhotoAlbum::Photo < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :image, :name, :photo_album_id, :description, :main

  belongs_to :photo_album

  mount_uploader :image, PhotoAlbum::PhotoUploader

  validates :image, :presence => true
end