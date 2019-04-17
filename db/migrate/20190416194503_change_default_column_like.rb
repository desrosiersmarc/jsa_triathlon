class ChangeDefaultColumnLike < ActiveRecord::Migration[5.1]
  def change
    change_column_default :likes, :like, from: nil, to: 0
  end
end
