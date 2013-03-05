class AddPhotoAlbumIdToEvents < ActiveRecord::Migration
  def change
     add_column :events, :photo_album_id, :integer
  end
end
