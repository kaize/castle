class RemoveSlugFromPages < ActiveRecord::Migration
  def up
    remove_column :pages, :uri
  end

  def down
    add_column :pages, :uri, :string
  end
end
