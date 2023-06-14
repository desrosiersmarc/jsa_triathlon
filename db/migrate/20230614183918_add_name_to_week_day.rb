class AddNameToWeekDay < ActiveRecord::Migration[6.1]
  def change
    add_column :week_days, :name, :string
  end
end
