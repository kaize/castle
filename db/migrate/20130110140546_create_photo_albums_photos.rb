class CreatePhotoAlbumsPhotos < ActiveRecord::Migration
  def change
    create_table :photo_album_photos do |t|
      t.integer :photo_album_id
      t.string :image
      t.string :name
      t.string :string
      t.boolean :main

      t.timestamps
    end
  end
end
