class AddColumnPhotosCountToPhotoAlbum < ActiveRecord::Migration
  def change
    add_column :photo_albums, :photos_count, :integer
  end
end
