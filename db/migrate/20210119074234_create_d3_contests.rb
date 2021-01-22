class CreateD3Contests < ActiveRecord::Migration[5.1]
  def change
    create_table :d3_contests do |t|
      t.datetime :date
      t.string :location
      t.references :contest_type, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
