class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :page_activity

      t.timestamps
    end
  end
end
