class AddMenuItemReferencesToPages < ActiveRecord::Migration
  def change
    add_column :pages, :menu_item_id, :integer
  end
end
