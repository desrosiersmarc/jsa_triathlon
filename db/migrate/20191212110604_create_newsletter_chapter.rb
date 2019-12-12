class CreateNewsletterChapter < ActiveRecord::Migration[5.1]
  def change
    Newsletter.create(id: 1, name: 'Introduction', content: "C'est à vous")
    Newsletter.create(id: 2, name: "Le mot de l'entraineur",content: "En janvier, c'est foncier")
  end
end
