require 'rails_helper'

RSpec.feature "User visits home page" do
  scenario "and creates an account" do

    visit root_path

    expect(page).to have_link "Login"

    click_on "Login"

    expect(current_path).to eq login_path
    expect(page).to have_link "Create Account"

    click_on "Create Account"

    fill_in "user[username]", with: "scootypuffjr"
    fill_in "user[password]", with: "suuuuuuuucks"

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
  end
end
