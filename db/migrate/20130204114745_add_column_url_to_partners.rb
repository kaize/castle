class AddColumnUrlToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :url, :string
  end
end
