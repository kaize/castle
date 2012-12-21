class FixGroupShedules < ActiveRecord::Migration
  def change
    change_table :group_schedules do |t|
      t.date :date
      t.change :start_at, :time
      t.change :finish_at, :time
    end
  end
end
