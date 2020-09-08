class AddAncestryToTimePeriod < ActiveRecord::Migration[5.1]
  def change
    add_column :time_periods, :ancestry, :string
    add_index :time_periods, :ancestry
  end
end
