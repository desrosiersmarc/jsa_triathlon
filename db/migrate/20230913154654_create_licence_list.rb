class CreateLicenceList < ActiveRecord::Migration[6.1]
  def change
    Licence.create(id:1, name:"Ecole de Tri - Compétition")
    Licence.create(id:2, name:"Ecole de Tri - Découverte")
    Licence.create(id:3, name:"Adultes - Compétition")
  end
end
