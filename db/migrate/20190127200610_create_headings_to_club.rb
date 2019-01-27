class CreateHeadingsToClub < ActiveRecord::Migration[5.1]
  def change
    Club.find(1).update(subject: 'Histoire du club')
    Club.create! id:2,
                  content: "Faire un article pour lister les lieux d'entrainements",
                  subject: "Les lieux d'entrainements" ,
                  user_id: User.first.id
    Club.create! id:3,
                  content: "Article présentant le bureau",
                  subject: "Le bureau" ,
                  user_id: User.first.id
    Club.create! id:4,
                  content: "Rubriques présentant les commissions",
                  subject: "Les commissions",
                  user_id: User.first.id
  end
end
