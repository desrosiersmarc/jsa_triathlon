class ChangeColumnDefaultProductStock < ActiveRecord::Migration[5.1]
  def change
    change_column_default :products, :stock, from: nil, to: 1
  end
end

