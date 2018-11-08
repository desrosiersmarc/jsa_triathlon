class ChangeColumnLikeToPictures < ActiveRecord::Migration[5.1]
  def change
    remove_column :pictures, :like, :string
    add_column :pictures, :like, :integer
  end
end
