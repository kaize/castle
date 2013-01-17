class AddColumnUnionIdToStudyRequest < ActiveRecord::Migration
  add_column :study_requests, :union_id, :integer
end
