require 'rails_helper'

RSpec.describe "Accessing admin dashboard" do
  scenario "as an admin"  do
    @admin = User.create(username: "Bob", email: "bob@bob", password: "centrelli",
                        role: 1)
    visit root_path

    within '.acct-dropdown-menu' do
      click_link "Login"
    end

    expect(current_path).to eq login_path
    fill_in "Username", with: "Bob"
    fill_in "Password", with: "centrelli"
    click_button "Get Ur Scoot On"
    expect(current_path).to eq dashboard_path

    within '.acct-dropdown-menu' do
      click_link "Admin Dashboard"
    end

    expect(current_path).to eq admin_user_path(@admin)
    expect(page).to have_content "you currently possess the almighty admin privilages"  #at this point admin is logged-in

    visit admin_dashboard_path
    # save_and_open_page
    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Admin Dashboard")
  end
  scenario "As a registered user (non-admin)" do

    user = User.create(username: "Bobby", email: "bob@bob", password: "centrelli",
                        role: 0)

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist (404)")

  end
  scenario "As an unregistered user" do

    user = nil

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist (404)")

  end
end
