class AddDisplayProfilToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :display_profil, :boolean
  end
end
