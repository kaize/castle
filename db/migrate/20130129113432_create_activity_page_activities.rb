class CreateActivityPageActivities < ActiveRecord::Migration
  def change
    create_table :activity_page_activities do |t|
      t.integer :activity_id
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
  
