# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

h1 = House.create(address: 'Home')
h2 = House.create(address: 'House')

taylor = People.create(name: "Taylor", house_id: h1)
sam = People.create(name: "Sam", house_id: h2)
