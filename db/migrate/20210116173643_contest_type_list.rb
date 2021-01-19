class ContestTypeList < ActiveRecord::Migration[5.1]
  def change
    ContestType.create(id:1, name: 'Sélection', abbreviation: 'S')
    ContestType.create(id:2, name: 'Demi-Finale', abbreviation: '1/2')
    ContestType.create(id:3, name: 'Finale', abbreviation: 'F')
  end
end
