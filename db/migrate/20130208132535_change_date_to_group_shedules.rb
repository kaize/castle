class ChangeDateToGroupShedules < ActiveRecord::Migration
  def change
    rename_column :group_schedules, :date, :week
    change_column :group_schedules, :week, :string
  end
end
