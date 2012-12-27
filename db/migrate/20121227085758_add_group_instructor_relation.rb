class AddGroupInstructorRelation < ActiveRecord::Migration
  def change
    create_table :group_instructor_relations do |t|
      t.integer :group_id
      t.integer :instructor_id
      t.timestamps
    end
  end
end
