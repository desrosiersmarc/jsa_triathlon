class AddDefaultValuesToProduct < ActiveRecord::Migration[5.1]
  def change
    change_column_default :products, :size_id, 0
    change_column_default :products, :sex, 'Unisex'
    change_column_default :products, :sport_type_id, 1
    change_column_default :products, :product_type_id, 1
  end
end
