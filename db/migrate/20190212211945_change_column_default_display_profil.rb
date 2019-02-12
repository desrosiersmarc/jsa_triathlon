class ChangeColumnDefaultDisplayProfil < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :display_profil, from: false, to: true
  end
end
