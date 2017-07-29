require 'rails_helper'

RSpec.describe "A user sees thier completed orderss" do
  scenario "logged-in user can see all completed orders" do

    user = create(:user)
    user_order1 = create(:order, user_id: user.id)
    user_order2 = create(:order, user_id: user.id)

    visit user_orders_path(user)

    expect(page).to have_content("Your order from #{user_order1.submitted_at}")
    expect(page).to have_content("Your order from #{user_order2.submitted_at}")
    save_and_open_page
  end
end
