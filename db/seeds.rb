# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@goto.comm', first_name: 'Oleg', last_name: 'Cherednichenko', start_date: Time.zone.now, password: 'adminadmin')

10.times do |n|
  User.create(email: "#{n}_user@example.com", first_name: "#{n}_name", last_name: "#{n}_last_name", password: 'password')
end
