class AddOrderAtToPages < ActiveRecord::Migration
  def change
    add_column :pages, :order_at, :integer
  end
end
