User.destroy_all
Category.destroy_all
Item.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin = User.create(username: 'mikelsage', password: 'password', email: 'michael@scoots.com', role: 1)
user = User.create(username: 'user', password: 'user', email: 'user@scoots.com')

cat1 = Category.create(name: 'Fast Scoots')
cat2 = Category.create(name: 'Slow Scoots')

item1 = Item.create!(title: 'Scooter', description: 'Its a scooter', price: 39.99, category_ids: [cat1.id])
item2 = Item.create!(title: 'Faster Scooter', description: 'Its a faster scooter', price: 39.99, category_ids: [cat1.id])
item3 = Item.create!(title: 'Slower Scooter', description: 'Its a slower scooter', price: 39.99, category_ids: [cat2.id])


# cat1.items << [item1, item2]
# cat2.items << item3
# cat1.save
# cat2.save
