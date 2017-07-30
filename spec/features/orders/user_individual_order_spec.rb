require 'rails_helper'

RSpec.describe "A logged-in user has a previous order" do
  scenario "and can see the individual order" do
  user = create(:user)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  order = create(:order, :with_items, item_count: 3, user_id: user.id)

  item1 = order.items.first
  item2 = order.items.last

  visit orders_path

  expect(page).to have_content "Your order from #{order.submitted_at}"
  expect(page).to have_link "View Order"

  click_on "View Order"

  expect(page).to have_content item1.image
  expect(page).to have_content item2.image
  expect(page).to have_content item1.quantity
  expect(page).to have_content item2.quantity
  expect(page).to have_content item1.line_item_total
  expect(page).to have_content item2.line_item_total
  expect(page).to have_link item1.title
  expect(page).to have_link item2.title
  expect(page).to have_content order.status
  expect(page).to have_content order.total_price
  expect(page).to have_content order.submitted_at
  expect(page).to have_content order.resolved_at
  end
end
