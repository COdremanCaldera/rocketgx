# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
condition = ["Impecable", "Bueno", "Regular", "Deficiente"]
rating = [5, 4, 3, 2, 1]
price = [10, 20, 30, 40, 50]
puts "creando usuarios"

user = User.new(email: "mercantil@gmail.com",
                password: "123456",
                first_name: "Mercantil",
                last_name: "Banco",
                phone: "123456789",
                address: "Av Caracas, 12345 con calle tu corazón")
file = URI.open("https://subastamacpanama.org/wp-content/uploads/2020/11/logo-mercantil-600x450.jpg")
user.photo_user.attach(io: file, filename: "user1.png", content_type: "image/png")
if user.save
  puts "usuario 1 creado"
else
  render :new, status: :unprocessable_entity
end

user2 = User.new(email: "caracas@gmail.com",
                 password: "123456",
                 first_name: "Caracas",
                 last_name: "ciudad",
                 phone: "547896547",
                 address: "Av Caracas, 12345 con calle tu corazón")
file = URI.open("https://uvn-brightspot.s3.amazonaws.com/assets/vixes/imj/nuestrorumbo/M/Monumentos-historicos-en-Venezuela.jpg")
user2.photo_user.attach(io: file, filename: "user2.png", content_type: "image/png")
if user2.save
  puts "usuario 2 creado"
else
  render :new, status: :unprocessable_entity
end

user3 = User.new(email: "venezuela@gmail.com",
                 password: "123456",
                 first_name: "Venezuela",
                 last_name: "pais",
                 phone: "321445657",
                 address: "Av Caracas, 12345 con calle tu corazón")
file = URI.open("https://penntoday.upenn.edu/sites/default/files/2019-05/VenezuelanFlag.jpg")
user3.photo_user.attach(io: file, filename: "user3.png", content_type: "image/png")
if user3.save
  puts "usuario 3 creado"
else
  render :new, status: :unprocessable_entity
end

videogame = Videogame.new(title: "fifa23",
                          rating: rating.sample,
                          condition: condition.sample,
                          price: price.sample,
                          user_id: 1)
file = URI.open("https://static.actugaming.net/media/2022/03/fifa-23-jaquette-mbappe.jpg")
videogame.photo.attach(io: file, filename: "fifa23.png", content_type: "image/png")

if videogame.save
  puts "Juego 1 usuario 0 creado"
else
  render :new, status: :unprocessable_entity
end

videogame = Videogame.new(title: "Cod",
                          rating: rating.sample,
                          condition: condition.sample,
                          price: price.sample,
                          user_id: 1)
file = URI.open("https://www.empireposter.de/bilder/bilder_XL/803733.jpg")
videogame.photo.attach(io: file, filename: "cod.png", content_type: "image/png")

if videogame.save
  puts "Juego 2 usuario 0 creado"
else
  render :new, status: :unprocessable_entity
end

videogame = Videogame.new(title: "Los Sims",
                          rating: rating.sample,
                          condition: condition.sample,
                          price: price.sample,
                          user_id: 2)
file = URI.open("https://static1.srcdn.com/wordpress/wp-content/uploads/2020/10/The-Sims-4-Poster-Cover-Art.jpg")
videogame.photo.attach(io: file, filename: "sims.png", content_type: "image/png")

if videogame.save
  puts "Juego 1 usuario 1 creado"
else
  render :new, status: :unprocessable_entity
end

videogame = Videogame.new(title: "GTA",
                          rating: rating.sample,
                          condition: condition.sample,
                          price: price.sample,
                          user_id: 2)
file = URI.open("https://wallpapercave.com/wp/wp4897799.jpg")
videogame.photo.attach(io: file, filename: "gta.png", content_type: "image/png")

if videogame.save
  puts "Juego 2 usuario 1 creado"
else
  render :new, status: :unprocessable_entity
end

videogame = Videogame.new(title: "SpiderMan",
                          rating: rating.sample,
                          condition: condition.sample,
                          price: price.sample,
                          user_id: 3)
file = URI.open("https://picfiles.alphacoders.com/147/thumb-1920-147468.jpg")
videogame.photo.attach(io: file, filename: "spiderman.png", content_type: "image/png")

if videogame.save
  puts "Juego 1 usuario 2 creado"
else
  render :new, status: :unprocessable_entity
end

videogame = Videogame.new(title: "NBA Finals",
                          rating: rating.sample,
                          condition: condition.sample,
                          price: price.sample,
                          user_id: 3)
file = URI.open("https://st.hzcdn.com/simgs/d95198e70c815446_9-6907/home-design.jpg")
videogame.photo.attach(io: file, filename: "nba.png", content_type: "image/png")

if videogame.save
  puts "Juego 2 usuario 2 creado"
else
  render :new, status: :unprocessable_entity
end

puts "Listo"
