# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
require 'date'


User.destroy_all
Event.destroy_all
Attendance.destroy_all

array_user = []
array_event = []
array_att = []
duration = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]


20.times do |index|
    array_user << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Movies::Hobbit.quote, email: index.to_s + "@yopmail.com", password:"youcef")
end

10.times do
    array_event << Event.create(start_date: Faker::Time.between(from: Time.now,to: 7.days.from_now), duration: duration.sample, title: Faker::Movies::StarWars.planet, description: Faker::Lorem.sentence, price: rand(1..1000), location: Faker::Address.city, user: array_user.sample)
end

30.times do 
    array_att << Attendance.create(user: array_user.sample, event: array_event.sample)
end
