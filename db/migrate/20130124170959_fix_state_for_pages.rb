class FixStateForPages < ActiveRecord::Migration
  def up
     Page.update_all(state: nil, state: :published)
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the changes state pages"
  end
  
end
