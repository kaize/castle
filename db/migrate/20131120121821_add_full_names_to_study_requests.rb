class AddFullNamesToStudyRequests < ActiveRecord::Migration
  def change
    add_column :study_requests, :parent_full_name, :string
    add_column :study_requests, :children_full_name, :string
  end
end
