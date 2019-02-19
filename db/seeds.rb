# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 5 users with companies'
5.times do
  puts "Create User"
  user = User.create!(
    name: Faker::TvShows::HowIMetYourMother.character,
    email: Faker::Internet.email,
    password: '123456')
  puts "Create company"
  company = Company.create!(
    name: Faker::Company.name,
    cnpj: Faker::Number.number(14),
    user: user)
  puts "Create flight"
  3.times do Flight.create!(
    origin: Faker::Nation.capital_city,
    destiny: Faker::Nation.capital_city,
    date: Faker::Date.forward(23),
    capacity: 10,
    price: 1500,
    company: company,
    description: Faker::Hacker.say_something_smart)
  end
end
puts 'Finished'
puts 'Creating 5 users without company'
5.times do
  user = User.create!(
    name: Faker::TvShows::HowIMetYourMother.character,
    email: Faker::Internet.email,
    password: '123456')
end
puts 'Finished'
