# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

item1 = Item.create(title: 'Scooter', description: 'Its a scooter', price: 39.99)
item2 = Item.create(title: 'Faster Scooter', description: 'Its a faster scooter', price: 39.99)
item3 = Item.create(title: 'Slower Scooter', description: 'Its a slower scooter', price: 39.99)

cat1 = Category.create(name: 'Fast Scoots')
cat2 = Category.create(name: 'Slow Scoots')

cat1.items << [item1, item2]
cat2.items << item3
