class AddProfilToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profil, :string
    add_column :users, :office_member, :boolean
  end
end
