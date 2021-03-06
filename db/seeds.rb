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

user = User.new
user.email = 'test@example.com'
user.password = 'password'
user.password_confirmation = 'password'
user.save!

address = ["Rue Commandant Ponthier 2, 1040 Etterbeek" , "Rue Vilain XIIII 14, 1050 Ixelles", "Rue Désiré Seutin 30, 1440 Wauthier-Braine "]

10.times do
  p file = URI.open("https://res.cloudinary.com/dehhegjqh/image/upload/v1589968191/toilets/toilet#{rand(1..11)}.jpg")
  toilet = Toilet.new(
    description: Faker::Quote.yoda,
    address: address.sample,
    style: ["japanese", "french", "US"].sample,
    user: user,
  )
  toilet.photo.attach(io: file, filename: "#{Faker::Artist.name}.png", content_type: 'image/png')
  toilet.save!
end



# file = URI.open(cl_image_tag("toilets/toilet#{rand(1..11)}"))

