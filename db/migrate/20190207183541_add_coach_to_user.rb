class AddCoachToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :coach, :boolean
  end
end
