class AddStravaProfilToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :strava_profil, :string
  end
end
