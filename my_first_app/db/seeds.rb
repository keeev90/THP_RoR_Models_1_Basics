# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# !!! WARNING !!!
# Avant d'exécuter un nouveau seed, il est généralement intelligent de remettre sa base de données à 0 pour éviter d'accumuler, au fil des seeds, une armée d'utilisateurs ayant les mêmes attributs.
# >>> $ User.destroy_all

# Utiliser la gem Faker pour seeder avec des attributs un peu moins pourris que "Nom1", "Nom2"  etc de manière aléatoire
require 'faker'

100.times do
  user = User.create!(first_name: Faker::Name.first_name, email: Faker::Internet.email)
end