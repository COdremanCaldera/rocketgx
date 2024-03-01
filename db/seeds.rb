# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "creando usuarios"

user = User.new(email: "mercantil@gmail.com",
                password: "123456",
                first_name: "Mercantil",
                last_name: "Banco",
                address: "Av Caracas, 12345 con calle tu corazón")

if user.save
  puts "usuario creado"
else
  render :new, status: :unprocessable_entity
end

puts "Listo"
