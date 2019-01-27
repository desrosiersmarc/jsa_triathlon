class AddSubjectToClub < ActiveRecord::Migration[5.1]
  def change
    add_column :clubs, :subject, :string
  end
end
