class AddSkillsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :skill_swim, :string
    add_column :users, :skill_bike, :string
    add_column :users, :skill_run, :string
  end
end
