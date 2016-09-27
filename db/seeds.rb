# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ship.find_or_create_by(name: 'Carrier', quantity: 1)
Ship.find_or_create_by(name: 'Battleship', quantity: 1)
Ship.find_or_create_by(name: 'Destroyer', quantity: 1)
Ship.find_or_create_by(name: 'Submarine', quantity: 2)
Ship.find_or_create_by(name: 'Patrol Boat', quantity: 2)
