class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :body
      t.datetime :published_at
      t.string :state

      t.timestamps
    end
  end
end
