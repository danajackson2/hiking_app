# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Trail.destroy_all
Trip.destroy_all
Hiker.destroy_all

30.times do
    Trail.create(name: Faker::Mountain.name,length: rand(10..100),location: Faker::Address.state)
end

5.times do
    Hiker.create(name: Faker::Name.name)
end

10.times do
    Trip.create(hiker_id: rand(1..5), trail_id: rand(1..30), date: Faker::Date.between(from: '2020-12-16', to: '2020-12-30'))
end

puts "Seeded"