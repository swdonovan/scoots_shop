require 'rails_helper'

RSpec.feature "User visits home page" do
  scenario "and clicks 'Login' without an account" do

    visit root_path

    expect(page).to have_link "Login"

    click_on "Login"

    expect(current_path).to eq login_path
    expect(page).to have_link "Create Account"

    click_on "Create Account"

    expect(current_path).to eq new_user_path

    fill_in "user[username]", with: "scootypuffjr"
    fill_in "user[password]", with: "suuuuuuuucks"
    fill_in "user[address]", with: "123 Street St"
    fill_in "user[email]", with: "spjunior@planetexpress.com"

    click_on "Get Ur Scoot On"

    expect(current_path).to eq("/dashboard")

    user = User.last

    within(".navbar") do
      expect(page).to have_content("Logged in as #{user.username}")
    end

    expect(page).to have_content(user.username)
    expect(page).to have_content(user.address)
    expect(page).to have_content(user.email)
    expect(page).to_not have_link "Login"
    expect(page).to have_link "Logout"
  end
end
