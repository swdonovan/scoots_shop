require 'rails_helper'

RSpec.describe "A logged-in user that is an admin has a previous order" do
  scenario "and can see the individual order" do
  user = create(:user)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  user.admin!

  item1, item2 = create_list(:item, 2)

  order = create(:order, user_id: user.id)
  order.items << [item1, item2]
  item1, item2 = order.order_items
  item1.item_quantity = 2
  item2.item_quantity = 1
  item1.line_item_total = item1.item_quantity * item1.item.price
  item2.line_item_total = item2.item_quantity * item2.item.price
  order.save
  item1.save
  item2.save

  visit admin_order_path(order)

  expect(page).to have_content "Order placed #{order.created_at}"
  expect(current_path).to eq admin_order_path(order)
  expect(page).to have_css "img[src='#{item1.item.image}']"
  expect(page).to have_css "img[src='#{item2.item.image}']"
  expect(page).to have_content item1.item_quantity
  expect(page).to have_content item2.item_quantity
  expect(page).to have_content item1.line_item_total
  expect(page).to have_content item2.line_item_total
  expect(page).to have_link item1.item.title
  expect(page).to have_link item2.item.title
  expect(page).to have_content order.status.capitalize
  expect(page).to have_content order.total_price
  expect(page).to have_content order.created_at
  expect(page).to have_content order.resolved_at
  end

  scenario "and can see the individual order" do
    user = create(:user)
    user_2 = User.create(full_name: "BILLY BOB", username: "BOBS", email: "b@b.com", password: "help")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

    item1, item2 = create_list(:item, 2)

    order = create(:order, user_id: user.id)
    order.items << [item1, item2]
    item1, item2 = order.order_items
    item1.item_quantity = 2
    item2.item_quantity = 1
    item1.line_item_total = item1.item_quantity * item1.item.price
    item2.line_item_total = item2.item_quantity * item2.item.price
    order.save
    item1.save
    item2.save

    visit admin_order_path(order)

    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
