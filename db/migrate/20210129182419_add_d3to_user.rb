class AddD3toUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :d3, :boolean
    add_column :users, :d3_manager, :boolean
  end
end
