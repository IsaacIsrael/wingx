# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 5 users with companies'
5.times do |i|
  puts "Create User"
  user = User.create!(
    name: Faker::TvShows::HowIMetYourMother.character,
    email: "teste#{i+1}@teste.com",
    password: '123123')
  puts "Create company"
  company = Company.create!(
    name: Faker::Company.name,
    cnpj: Faker::Number.number(14),
    user: user,
    remote_photo_url: "https://source.unsplash.com/1600x900/?company,startup,enterprise")
  puts "Create flight"
  3.times do Flight.create!(
    origin: Faker::Nation.capital_city,
    destiny: Faker::Nation.capital_city,
    date: Faker::Date.forward(23),
    capacity: 10,
    price: 1500,
    company: company,
    description: Faker::Hacker.say_something_smart,
    remote_photo_url: "https://source.unsplash.com/1600x900/?airplane,flights,travel")
  end
end
puts 'Finished'
puts 'Creating 5 users without company'
5.times do |i|
  user = User.create!(
    name: Faker::TvShows::HowIMetYourMother.character,
    email: "teste#{i+6}@teste.com",
    password: '123123')
end
puts 'Finished'
