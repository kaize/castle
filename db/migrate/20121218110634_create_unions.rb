class CreateUnions < ActiveRecord::Migration
  def change
    create_table :unions do |t|
      t.string :name
      t.text :description
      t.integer :category_id

      t.timestamps
    end
  end
end
