class CreateUnionPhotos < ActiveRecord::Migration
  def change
    create_table :union_photos do |t|
      t.string :name
      t.string :asset
      t.integer :union_id

      t.timestamps
    end
  end
end
