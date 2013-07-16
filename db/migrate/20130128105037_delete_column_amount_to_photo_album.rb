class DeleteColumnAmountToPhotoAlbum < ActiveRecord::Migration
  def up
    remove_column :photo_albums, :amount
  end

  def down
  end
end
