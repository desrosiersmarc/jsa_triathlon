class AddLicenceReferenceToWorkouts < ActiveRecord::Migration[6.1]
  def change
    add_reference :workouts, :licence, foreign_key: true
  end
end
