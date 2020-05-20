# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

User.destroy_all
Toilet.destroy_all

p user = User.new
user.email = 'test@example.com'
user.password = 'password'
user.password_confirmation = 'password'
user.save!

10.times do
  p file = URI.open('https://source.unsplash.com/random/400x300')
  p toilet = Toilet.new(
    description: Faker::Artist.name,
    address: Faker::Address.full_address,
    style: ["japanese", "french", "US"].sample,
    user: user,
  )
  toilet.photo.attach(io: file, filename: "#{Faker::Artist.name}.png", content_type: 'image/png')
  toilet.save!
end

