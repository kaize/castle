class CreateUnionInstructorRelations < ActiveRecord::Migration
  def change
    create_table :union_instructor_relations do |t|
      t.integer :union_id
      t.integer :instructor_id
      t.boolean :leader

      t.timestamps
    end
  end
end
