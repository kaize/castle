class FixNilStateForPages < ActiveRecord::Migration
  def up
    Page.where(:state => nil).update_all(:state => "published")
  end

  def down
  
  end
end
