require 'rails_helper'

RSpec.feature "User visits the home page" do
  scenario "and can log in and out" do
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

    within(".navbar") do
      expect(page).to have_content("Logged in as #{user_attributes[:username]}")
    end

    expect(page).to have_content(user.username)
    expect(page).to have_content(user.address)
    expect(page).to have_content(user.email)
    expect(page).to_not have_link "Login"

    expect(page).to have_link "Logout"

    click_on "Logout"

    expect(page).to have_link "Login"
    expect(page).to_not have_link "Logout"
  end
end
