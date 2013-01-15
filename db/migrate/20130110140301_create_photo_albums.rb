class CreatePhotoAlbums < ActiveRecord::Migration
  def change
    create_table :photo_albums do |t|
      t.string :name
      t.string :state
      t.string :description

      t.timestamps
    end
  end
end
