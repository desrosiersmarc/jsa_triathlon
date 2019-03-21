class ChangeColumnDefaultProduct < ActiveRecord::Migration[5.1]
  def change
    change_column_default :products, :active, from: false, to: true
  end
end
