# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Delete pictures"
  Picture.delete_all

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

