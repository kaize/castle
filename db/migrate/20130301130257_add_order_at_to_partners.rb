class AddOrderAtToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :order_at, :integer
  end
end
