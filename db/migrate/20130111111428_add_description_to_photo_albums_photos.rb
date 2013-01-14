class AddDescriptionToPhotoAlbumsPhotos < ActiveRecord::Migration
  def change
    add_column :photo_album_photos, :description, :string
  end
end