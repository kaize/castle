class RemoveActivityAndPageActivity < ActiveRecord::Migration
  
  def up
    drop_table :activities
    drop_table :activity_page_activities
  end
  
  def down
    create_table :activities do |t|
      t.string :name
      t.text :page_activity

      t.timestamps
    end
    create_table :activity_page_activities do |t|
      t.integer :activity_id
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
