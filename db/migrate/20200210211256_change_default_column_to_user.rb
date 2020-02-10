class ChangeDefaultColumnToUser < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :mailing_group, from:2, to:3
  end
end
