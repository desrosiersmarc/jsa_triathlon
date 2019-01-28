class AddCoachTeamToClub < ActiveRecord::Migration[5.1]
  def change
    Club.create! id:5,
              content: "Liste à compléter",
              subject: "Les encadrants",
              user_id: User.first.id
  end
end
