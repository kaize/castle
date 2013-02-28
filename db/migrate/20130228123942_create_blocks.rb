class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :title
      t.text :body
      t.integer :order_at
      t.boolean :on_main
      t.string :state

      t.timestamps
    end
  end
end
