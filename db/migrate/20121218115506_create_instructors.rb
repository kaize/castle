class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.text :description
      t.string :avatar

      t.timestamps
    end
  end
end
