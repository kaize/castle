class AddColumnAmountToPhotoAlbum < ActiveRecord::Migration
  def change
    add_column :photo_albums, :amount, :integer
  end
end
