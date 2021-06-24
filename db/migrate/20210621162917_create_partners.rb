class CreatePartners < ActiveRecord::Migration[5.1]
  def change
    create_table :partners do |t|
      t.references :user, foreign_key: true
      t.text :name
      t.text :contact
      t.integer :offer
      t.text :website
      t.text :address
      t.text :description

      t.timestamps
    end
  end
end
