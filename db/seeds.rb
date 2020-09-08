# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

def set_article_types
  print "Delete Article Types"
  ArticleType.delete_all
  puts " : X"
  puts ""
  puts "Create Article Types"
    ArticleType.create! id:1, name: 'club'
    ArticleType.create! id:2, name: 'Entrainement'
    ArticleType.create! id:3, name: 'Course'
    ArticleType.create! id:4, name: 'Ecole'
    ArticleType.create! id:5, name: 'Partenaire'
    ArticleType.create! id:6, name: 'Résultat'
  puts "Article Types created"
end

def seed_user
  print "Create user"
  user_created = User.create(email: "md@md.fr", password: "123soleil", firstname: "Marc", lastname: "Desrosiers", birthday: '01/11/1972', mobil_phone: '0662262352')
  user_created = User.create(email: "alexisbonneau@gmail.com", password: "123soleil", firstname: "Alexis", lastname: "Bonneau", birthday: '01/11/1972', mobil_phone: '0606060606')
  user_created = User.create(email: "o.huti@orange.fr", password: "123soleil", firstname: "Olivier", lastname: "Hutinet", birthday: '01/11/1972', mobil_phone: '0606060606')
  user_created = User.create(email: "y.allard@ent-allard.com", password: "123soleil", firstname: "Yvette", lastname: "Allard", birthday: '01/11/1972', mobil_phone: '0606060606')
  user_created = User.create(email: "pandry@laposte.net", password: "123soleil", firstname: "Patrick", lastname: "Andry", birthday: '01/11/1972', mobil_phone: '0606060606')
  user_created = User.create(email: "seb.sudrie@hotmail.fr", password: "123soleil", firstname: "Sébastien", lastname: "Sudrie", birthday: '01/11/1972', mobil_phone: '0606060606')
  user_created = User.create(email: "hutinet.severine@orange.fr", password: "123soleil", firstname: "Séverine", lastname: "Hutinet", birthday: '01/11/1972', mobil_phone: '0606060606')
  user_created = User.create(email: "jf.hascoet@laposte.net ", password: "123soleil", firstname: "Jean-François", lastname: "Hascoet", birthday: '01/11/1972', mobil_phone: '0606060606')

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
      content: Faker::Lorem.paragraph(rand(0..3)),
      user: User.all.sample,
      article_type_id: ArticleType.all.sample.id,
      active: true)
  article.remote_photo_url = url
  article.save
      print "*"
end

def seed_pictures
    puts "Create pictures"
  url="http://eu.ironman.com/~/media/e52189b7e5f94db0bb2d43e717ec87ad/28092017%20rotator%20im703nice%203.jpg?w=1600&h=980&c=1"
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
  ProductType.create! id:1, name: "Tenues"
  ProductType.create! id:2, name: "Bourse d'échange"
  puts "Product types created<"
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
  description: Faker::Lorem.paragraph(rand(0..3)),
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
  filepath = "db/jsa_members_2020.csv"
  CSV.foreach(filepath) do |row|
    User.create(firstname: row[0],
                lastname: row[1],
                birthday: row[2],
                email: row[3],
                password: '123soleil',
                member: true,
                mobil_phone: '0000000000',
                profil: 'Membre')
    print "*"
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





case Rails.env
when "development"
  # puts "Delete all"
  #   Picture.delete_all
  #   Article.delete_all
  #   Product.delete_all
  #   User.delete_all
  #   Size.delete_all
  #   ProductType.delete_all
  #   SportType.delete_all

  # seed_user
  # seed_pictures
  # set_article_types

  # seed_sizes
  # seed_product_types
  # seed_sport_types


  # puts "Create Articles"
  #   60.times do seed_articles(ArticleType.all.sample)    end
  # puts ""
  # puts "Articles created"

  # puts "Create Products"
  # 10.times do seed_products end
  # puts "Products created"
  seed_user_production
  # seed_picture_albums

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
  seed_user_production
  # seed_picture_albums

end
