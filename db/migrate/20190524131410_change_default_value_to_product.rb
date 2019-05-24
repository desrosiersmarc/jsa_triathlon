class ChangeDefaultValueToProduct < ActiveRecord::Migration[5.1]
  def change
    change_column_default :products, :product_type_id, from: 1, to: 2
  end
end
