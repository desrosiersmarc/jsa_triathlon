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
  Picture.create(title: "Roc Azur",
    link: 'https://photos.app.goo.gl/3sAbyDVDjVxWJWDq8',
    date: '15 octobre 2018',
    user_id: User.first.id,
    like: 5)
  Picture.create(title: "Biscarrosse",
    link: 'https://photos.app.goo.gl/DaDZgD8ZhALD33f78',
    date: '23 septembre 2018',
    user_id: User.first.id,
    like: 12)

