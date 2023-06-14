class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.time :start_hour
      t.time :end_hour
      t.references :location, null: false, foreign_key: true
      t.references :week_day, null: false, foreign_key: true
      t.references :sport_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
