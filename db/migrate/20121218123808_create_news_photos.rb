class CreateNewsPhotos < ActiveRecord::Migration
  def change
    create_table :news_photos do |t|
      t.integer :news_id
      t.string :asset

      t.timestamps
    end
  end
end
