# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
  user_created = User.new(email: "md@md.fr", password: "123soleil", firstname: "Marc", lastname: "Desrosiers", birthday: '01/11/1972', mobil_phone: '0662262352')
  user_created.save
  puts " : X"
end

def seed_articles(article_type_sample_id)
  Article.create(
      name: Faker::FunnyName.name,
      date: Time.now.strftime('%v'),
      start_time: Time.now.strftime('%T'),
      end_time: Time.now.strftime('%T'),
      location: Faker::Address.city,
      link: Faker::Internet.url,
      content: Faker::Lorem.paragraph(rand(0..3)),
      user: User.all.sample,
      article_type_id: article_type_sample_id,
      photo: "http://res.cloudinary.com/dmbf8fog4/image/upload/v1544742939/gcbt5ejuknaxtuzxy0fd.jpg")
      print "*"
end


case Rails.env
when "development"
  puts "Delete all"
    Picture.delete_all
    Article.delete_all
    User.delete_all

  seed_user

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

  set_article_types


  puts "Create Articles"
    60.times do seed_articles(ArticleType.all.sample)    end
  puts ""
  puts "Articles created"
when "production"
  set_article_types
  seed_user
  seed_articles(1)
  seed_articles(2)
  seed_articles(3)
  seed_articles(4)
  seed_articles(5)
  seed_articles(6)
end
