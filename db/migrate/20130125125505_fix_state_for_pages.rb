class FixStateForPages < ActiveRecord::Migration
  def up
     Page.reset_column_information
     Page.update_all(state: :published, state: nil)
  end

  def down
   # raise ActiveRecord::IrreversibleMigration, "Can't recover the changes state pages"
  end
  
end
