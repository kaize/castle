class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :group_schedule_classrooms do |t|
      t.string :name
      
      t.timestamps
    end
    add_column :group_schedules, :classroom_id, :integer
  end
end
