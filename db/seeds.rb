# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
require 'csv'

def set_article_types
  print "Delete Article Types"
  ArticleType.delete_all
  puts " : X"
  puts ""
  puts "Create Article Types"
    # ArticleType.create! id:1, name: 'club'
    # ArticleType.create! id:2, name: 'Entrainement'
    # ArticleType.create! id:3, name: 'Course'
    # ArticleType.create! id:4, name: 'Ecole'
    # ArticleType.create! id:5, name: 'Partenaire'
    # ArticleType.create! id:6, name: 'Résultat'
  puts "Article Types created"
end

def seed_user
  print "Create user"
  # user_created = User.create(email: "md@md.fr", password: "123soleil", firstname: "Marc", lastname: "Desrosiers", birthday: '01/11/1972', mobil_phone: '0662262352', d3:true)
  # user_created = User.create(email: "alexisbonneau@gmail.com", password: "123soleil", firstname: "Alexis", lastname: "Bonneau", birthday: '01/11/1972', mobil_phone: '0606060606')
  # user_created = User.create(email: "o.huti@orange.fr", password: "123soleil", firstname: "Olivier", lastname: "Hutinet", birthday: '01/11/1972', mobil_phone: '0606060606')
  # user_created = User.create(email: "y.allard@ent-allard.com", password: "123soleil", firstname: "Yvette", lastname: "Allard", birthday: '01/11/1972', mobil_phone: '0606060606')
  # user_created = User.create(email: "pandry@laposte.net", password: "123soleil", firstname: "Patrick", lastname: "Andry", birthday: '01/11/1972', mobil_phone: '0606060606')
  # user_created = User.create(email: "seb.sudrie@hotmail.fr", password: "123soleil", firstname: "Sébastien", lastname: "Sudrie", birthday: '01/11/1972', mobil_phone: '0606060606')
  # user_created = User.create(email: "hutinet.severine@orange.fr", password: "123soleil", firstname: "Séverine", lastname: "Hutinet", birthday: '01/11/1972', mobil_phone: '0606060606')
  # user_created = User.create(email: "jf.hascoet@laposte.net ", password: "123soleil", firstname: "Jean-François", lastname: "Hascoet", birthday: '01/11/1972', mobil_phone: '0606060606')

  puts " : X"
end

def seed_articles(article_type_sample_id)
  url = "http://res.cloudinary.com/dmbf8fog4/image/upload/v1544742939/gcbt5ejuknaxtuzxy0fd.jpg"
  article = Article.create(
      name: Faker::FunnyName.name,
      date: Time.now.strftime('%v'),
      start_time: Time.now.strftime('%T'),
      end_time: Time.now.strftime('%T'),
      location: Faker::Address.city,
      link: Faker::Internet.url,
      content: Faker::Lorem.paragraph(sentence_count: rand(1..3)),
      user_id: User.all.sample.id,
      article_type_id: ArticleType.all.sample.id,
      active: true)
  article.remote_photo_url = url
  article.save
  Author.create!(user_id: User.all.sample.id, article_id: article.id)
      print "*"
end

def seed_pictures
    puts "Create pictures"
  url="https://res.cloudinary.com/dmbf8fog4/image/upload/v1593522828/JSA%20Triathlon/ironman42.jpg"
    pict = Picture.create(title: "Roc Azur",
      link: 'https://photos.app.goo.gl/3sAbyDVDjVxWJWDq8',
      date: '15 octobre 2018',
      user_id: User.first.id,
      like: 5)
    pict.remote_photo_url = url
    pict.save

    pict = Picture.create(title: "Biscarrosse",
    link: 'https://photos.app.goo.gl/3sAbyDVDjVxWJWDq8',
    date: '15 mars 2018',
    user_id: User.first.id,
    like: 5)
    pict.remote_photo_url = url
    pict.save
end

def seed_sizes
  puts "Create sizes"
  Size.create! id:0, name: 'Divers'
  Size.create! id:1, name: 'XXS'
  Size.create! id:2, name: 'XS'
  Size.create! id:3, name: 'S'
  Size.create! id:4, name: 'M'
  Size.create! id:5, name: 'L'
  Size.create! id:6, name: 'XL'
  Size.create! id:7, name: 'XXL'
  puts "Sizes created"
end

def seed_product_types
  puts "Create product types"
  # ProductType.create! id:1, name: "Tenues"
  # ProductType.create! id:2, name: "Bourse d'échange"
  puts "Product types created"
end

def seed_sport_types
  puts "Create sport types"
  SportType.create! id:1, name: "Triathlon"
  SportType.create! id:2, name: "Natation"
  SportType.create! id:3, name: "Vélo"
  SportType.create! id:4, name: "Course à pied"
  SportType.create! id:5, name: "Electro"
  puts "Sport types created"
end

def seed_products
  url = "http://res.cloudinary.com/dmbf8fog4/image/upload/v1544742939/gcbt5ejuknaxtuzxy0fd.jpg"
  product = Product.create(user_id: User.all.sample.id,
  name: 'Batman',
  size_id: Size.all.sample.id,
  description: Faker::Lorem.paragraph(sentence_count: rand(0..3)),
  price: rand(0..999),
  stock: rand(0..99),
  sex: ['Unisex', 'Femme', 'Homme'].sample,
  sport_type_id: SportType.all.sample.id,
  product_type_id: ProductType.all.sample.id,
  active: true)
  # product.remote_photo_url = url
  product.save
  print '*'

end

def seed_user_production
  filepath = "db/jsa_members_seed.csv"
  CSV.foreach(filepath) do |row|
    User.create(firstname: row[0],
                lastname: row[1],
                birthday: row[2],
                email: row[3],
                role: row[4],
                gender: row[5],
                d3: row[6],
                d3_manager: row[7],
                password: '123soleil',
                member: true,
                mobil_phone: '0000000000',
                profil: 'Membre')
    print "-"
    puts "#{row[0].upcase} #{row[1]} - #{row[2]} - #{row[3]}"
  end
end

def seed_picture_albums
  filepath = "db/recup_albums - csv.csv"
  puts "picture album creation"
  CSV.foreach(filepath) do |row|
    Picture.create(title: row[0],
                  date: row[1],
                  link: row[2],
                  user_id: User.first.id)
    print "*"
  end
  puts "Done !"
end

def seed_d3_contest_types
  ContestType.create!(id: 1, name: 'Sélection', abbreviation: 'S')
  ContestType.create!(id: 2, name: 'Demi Finale', abbreviation: '1/2')
  ContestType.create!(id: 3, name: 'Finale', abbreviation: 'F')
end

def seed_d3_contests
  D3Contest.create(
    date: '15/06/2021',
    location: 'Bordeaux',
    contest_type_id: 1,
    name: 'Triathlon du pont de pierre')

  D3Contest.create(
  date: '15/07/2021',
  location: 'Angoulême',
  contest_type_id: 2,
  name: 'Triathlon du Lac')

  D3Contest.create(
  date: '15/09/2021',
  location: 'Toulouse',
  contest_type_id: 3,
  name: "Triathlon de l'Espace")

end


def seed_partners
  10.times do
    Partner.create(
      user_id: User.first.id,
      name: Faker::FunnyName.three_word_name ,
      contact:Faker::Name.name ,
      offer: rand(0..99),
      website: Faker::Internet.domain_name,
      address: Faker::Address.full_address,
      description: Faker::ChuckNorris.fact
      )
  end
end

def seed_workouts
  25.times do
    Workout.create(
      name: "blabla bla",
      start_hour: DateTime.now - (rand * 21),
      end_hour: DateTime.now - (rand * 21),
      location_id: rand(1..4),
      week_day_id: rand(1..7),
      sport_type_id: rand(2..4)
    )  
  end
end


case Rails.env
when "development"
  # puts "Delete all"
  #   Picture.delete_all
  #   Author.delete_all
  #   Article.delete_all
  #   Product.delete_all
  #   User.delete_all
  #   Size.delete_all
  #   ProductType.delete_all
  #   SportType.delete_all
  #   D3Contest.delete_all
  #   ContestType.delete_all
  # Partners.delete_all
  seed_workouts




  # seed_user
  # seed_pictures
  # set_article_types

  # seed_sizes
  # seed_product_types
  # seed_sport_types

  # seed_d3_contest_types
  # seed_d3_contests

  # puts "Create Products"
  # 10.times do seed_products end
  # puts "Products created"

  # seed_user_production
  # seed_picture_albums

  # Add D3 results

  # puts "Create Articles"
  #   60.times do seed_articles(ArticleType.all.sample)    end
  # puts ""
  # puts "Articles created"


when "production"
  # set_article_types
  # seed_user
  # seed_articles(1)
  # seed_articles(2)
  # seed_articles(3)
  # seed_articles(4)
  # seed_articles(5)
  # seed_articles(6)
  #seed_sizes
  #seed_product_types
  #seed_sport_types
  # seed_user_production
  # seed_picture_albums

end
