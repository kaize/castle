class CreateStudyRequests < ActiveRecord::Migration
  def change
    create_table :study_requests do |t|
      t.string :parent_first_name
      t.string :parent_last_name
      t.string :parent_middle_name
      t.string :children_first_name
      t.string :children_last_name
      t.string :children_middle_name
      t.date :birth_date
      t.string :school
      t.string :address
      t.string :phone
      t.text :note

      t.timestamps
    end
  end
end
