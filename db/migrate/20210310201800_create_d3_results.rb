class CreateD3Results < ActiveRecord::Migration[5.1]
  def change
    create_table :d3_results do |t|
      t.integer :rank
      t.time :swim
      t.time :t1
      t.time :bike
      t.time :t2
      t.time :run
      t.time :total
      t.references :user, foreign_key: true
      t.references :d3_contest, foreign_key: true

      t.timestamps
    end
  end
end
