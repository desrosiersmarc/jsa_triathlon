class AddActiveToPartner < ActiveRecord::Migration[5.1]
  def change
    add_column :partners, :active, :boolean
  end
end
