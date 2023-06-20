class LocationsList < ActiveRecord::Migration[6.1]
  def change
    Location.create(id: 1, name:'Nautilis')
    Location.create(id: 2, name:'Stade de ma Campagne')
    Location.create(id: 3, name:"Plan d'eau de Saint Yrieix")
    Location.create(id: 4, name:"Place Mullac")
  end
end
