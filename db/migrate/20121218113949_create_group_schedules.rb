class CreateGroupSchedules < ActiveRecord::Migration
  def change
    create_table :group_schedules do |t|
      t.datetime :start_at
      t.datetime :finish_at
      t.integer :group_id

      t.timestamps
    end
  end
end
