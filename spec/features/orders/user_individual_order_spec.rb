require 'rails_helper'
# Background: An existing user that has one previous order
RSpec.describe "A logged-in user has a previous order" do
# As an authenticated user
  scenario "and can see the individual order" do
  user = create(:user)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  order = create(:order, :with_items, item_count: 3, user_id: user.id)
  # require 'pry', binding.pry
  item1 = order.items.first
  item2 = order.items.last
# When I visit "/orders"
  visit orders_path
# Then I should see my past order
  expect(page).to have_content "Your order from #{order.submitted_at}"
# And I should see a link to view that order
  expect(page).to have_link "View Order"
# And when I click that link
  click_on "View Order"
# Then I should see each item that was ordered with the quantity and line-item subtotals
  expect(page).to have_content item1.image
  expect(page).to have_content item2.image

  expect(page).to have_content item1.quantity
  expect(page).to have_content item2.quantity

  expect(page).to have_content item1.line_item_total
  expect(page).to have_content item2.line_item_total

# And I should see links to each item's show page
  expect(page).to have_link item1.title
  expect(page).to have_link item2.title
# And I should see the current status of the order (ordered, paid, cancelled, completed)
  expect(page).to have_content order.status
# And I should see the total price for the order
  expect(page).to have_content order.total_price
# And I should see the date/time that the order was submitted
  expect(page).to have_content order.created_at
# If the order was completed or cancelled
# Then I should see a timestamp when the action took place

  end
end
