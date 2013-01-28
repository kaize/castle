class AddColumnMainToEvent < ActiveRecord::Migration
  add_column :events, :main, :boolean
end
