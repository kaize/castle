class AddStatePages < ActiveRecord::Migration
  add_column :pages, :state, :string
end
