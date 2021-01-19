class AddAbbreviationToContestType < ActiveRecord::Migration[5.1]
  def change
    add_column :contest_types, :abbreviation, :string
  end
end
