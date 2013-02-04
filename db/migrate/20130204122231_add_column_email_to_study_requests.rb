class AddColumnEmailToStudyRequests < ActiveRecord::Migration
  def change
    add_column :study_requests, :email, :string
  end
end
