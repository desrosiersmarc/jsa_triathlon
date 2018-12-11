# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Delete all"
  Picture.delete_all
  Article.delete_all
  ArticleType.delete_all
  User.delete_all

puts "Create user"
user_created = User.new(email: "md@md.fr", password: "123soleil", firstname: "Marc", lastname: "Desrosiers", birthday: '01/11/1972', mobil_phone: '0662262352')
user_created.save


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

puts "Create Article Types"
  ArticleType.create(name: 'club')
  ArticleType.create(name: 'training')
  ArticleType.create(name: 'contest')
  ArticleType.create(name: 'school')
  ArticleType.create(name: 'partner')
puts "Article Types created"

puts "Create Articles"
  20.times do Article.create(
    name: Faker::FunnyName.name,
    date: Time.now.strftime('%v'),
    start_time: Time.now.strftime('%T'),
    end_time: Time.now.strftime('%T'),
    location: Faker::Address.city,
    link: Faker::Internet.url,
    content: Faker::Lorem.paragraph(rand(0..3)),
    user: User.all.sample,
    article_type: ArticleType.all.sample)
    print "*"
  end
puts ""
puts "Articles created"

