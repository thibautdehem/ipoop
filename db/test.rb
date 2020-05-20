
require 'open-uri'

p file = URI.open("https://res.cloudinary.com/dehhegjqh/image/upload/v1589968191/toilets/toilet#{rand(1..11)}.jpg")
p rand(1..11)
