# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ship.create(name: 'Carrier', quantity: 1)
Ship.create(name: 'Battleship', quantity: 4)
Ship.create(name: 'Destroyer', quantity: 1)
Ship.create(name: 'Submarine', quantity: 2)
Ship.create(name: 'Patrol Boat', quantity: 2)
