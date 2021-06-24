class AddPhotoToPartner < ActiveRecord::Migration[5.1]
  def change
    add_column :partners, :photo, :string
  end
end
