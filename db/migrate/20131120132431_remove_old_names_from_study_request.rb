class RemoveOldNamesFromStudyRequest < ActiveRecord::Migration
  def up
    remove_column :study_requests, :parent_first_name
    remove_column :study_requests, :parent_last_name
    remove_column :study_requests, :parent_middle_name
    remove_column :study_requests, :children_first_name
    remove_column :study_requests, :children_last_name
    remove_column :study_requests, :children_middle_name
  end

  def down
    add_column :study_requests, :children_middle_name, :string
    add_column :study_requests, :children_last_name, :string
    add_column :study_requests, :children_first_name, :string
    add_column :study_requests, :parent_middle_name, :string
    add_column :study_requests, :parent_last_name, :string
    add_column :study_requests, :parent_first_name, :string
  end
end
