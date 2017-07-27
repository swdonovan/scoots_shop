# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  title = Faker::Commerce.product_name
  price = Faker::Commerce.price
  description = Faker::HowIMetYourMother.quote
  image = Faker::LoremPixel.image
  Item.create(title: title, price: price, description: description, image: image)
end

item_ids = Item.pluck(:id)

5.times do
  name = Faker::Job.field
  category = Category.create(name: name)
  2.times do
    category.items << Item.find(item_ids.sample)
  end
end
