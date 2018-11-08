class AddLikeToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :like, :string
  end
end
