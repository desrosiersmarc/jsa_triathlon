class ChangeColumnToUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :skill_swim, 'boolean USING CAST(skill_swim AS boolean)'
    change_column :users, :skill_run, 'boolean USING CAST(skill_swim AS boolean)'
    change_column :users, :skill_bike, 'boolean USING CAST(skill_swim AS boolean)'
  end
end
