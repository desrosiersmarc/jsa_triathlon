class ChangeColumnDescriptionToTitleFromPicture < ActiveRecord::Migration[5.1]
  def change
    rename_column :pictures, :description, :title
  end
end
