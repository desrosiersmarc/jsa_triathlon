class AddRentToSportType < ActiveRecord::Migration[5.1]
  def change
    SportType.create! id: 6, name: 'Location'
  end
end
