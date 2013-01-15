class AddColumnMainToPhotoAlbum < ActiveRecord::Migration
  add_column :photo_albums, :main, :boolean
end
