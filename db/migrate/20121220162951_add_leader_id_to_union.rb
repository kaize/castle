class AddLeaderIdToUnion < ActiveRecord::Migration
  def change
    add_column :unions, :leader_id, :integer
  end
end
