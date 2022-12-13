class CreateFirstArticleClub < ActiveRecord::Migration[5.1]
  def change
    user_created = User.create(email: "md@md.fr", password: "123soleil", firstname: "Marc", lastname: "Desrosiers", birthday: '01/11/1972', mobil_phone: '0662262352')
    user_created = User.create(email: "alexisbonneau@gmail.com", password: "123soleil", firstname: "Alexis", lastname: "Bonneau", birthday: '01/11/1972', mobil_phone: '0606060606')
    user_created = User.create(email: "o.huti@orange.fr", password: "123soleil", firstname: "Olivier", lastname: "Hutinet", birthday: '01/11/1972', mobil_phone: '0606060606')
    user_created = User.create(email: "y.allard@ent-allard.com", password: "123soleil", firstname: "Yvette", lastname: "Allard", birthday: '01/11/1972', mobil_phone: '0606060606')
    user_created = User.create(email: "pandry@laposte.net", password: "123soleil", firstname: "Patrick", lastname: "Andry", birthday: '01/11/1972', mobil_phone: '0606060606')
    user_created = User.create(email: "seb.sudrie@hotmail.fr", password: "123soleil", firstname: "Sébastien", lastname: "Sudrie", birthday: '01/11/1972', mobil_phone: '0606060606')
    user_created = User.create(email: "hutinet.severine@orange.fr", password: "123soleil", firstname: "Séverine", lastname: "Hutinet", birthday: '01/11/1972', mobil_phone: '0606060606')
    user_created = User.create(email: "jf.hascoet@laposte.net ", password: "123soleil", firstname: "Jean-François", lastname: "Hascoet", birthday: '01/11/1972', mobil_phone: '0606060606')

    Club.create! id:1, content: 'Histoire du club', user_id: User.first.id
  end
end
