class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :content
      t.date :begin_date
      t.date :end_date
      t.string :image

      t.timestamps
    end
  end
end
