require 'rails_helper'

RSpec.describe "A user sees their completed orders" do
  scenario "logged-in user can see all completed orders" do
    user_attributes = {
                        username: "scootmaster",
                        password: "scootin",
                        address: "gettysburg",
                        email: "jwbooth@fordstheater.com"
                      }
    user = User.create(user_attributes)

    visit root_path

    expect(page).to have_link "Login"
    click_on "Login"

    expect(current_path).to eq(login_path)

    fill_in "Username", with: user_attributes[:username]
    fill_in "session[password]", with: user_attributes[:password]

    click_on "Get Ur Scoot On"

    expect(current_path).to eq("/dashboard")

    current_user = user

    user_order1 = create(:order, user_id: current_user.id)
    user_order2 = create(:order, user_id: current_user.id)

    visit orders_path

    expect(page).to have_content("Your order from #{user_order1.created_at}")
    expect(page).to have_content("Your order from #{user_order2.created_at}")

  end
end
