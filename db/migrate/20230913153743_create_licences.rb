class CreateLicences < ActiveRecord::Migration[6.1]
  def change
    create_table :licences do |t|
      t.text :name

      t.timestamps
    end
  end
end
