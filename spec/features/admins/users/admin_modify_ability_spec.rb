require 'rails_helper'

RSpec.describe 'As an admin' do
  scenario "admin can modify own info" do
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
    expect(current_path).to eq admin_dashboard_path

    visit dashboard_path(id: @admin.id)

    click_on "Edit Profile"

    expect(current_path).to eq(edit_user_path(@admin))
    expect(page).to have_content("Bob")

    fill_in "Username", with: "Bobby"
    click_on "Edit Your Account"

    expect(current_path).to eq(dashboard_path)
  end

  scenario "admin can't modify others info" do
    @admin = User.create(username: "Bob", email: "bob@bob", password: "centrelli",
                        role: 1)

    @user = User.create(username: "Billy", email: "billy@bob", password: "Sage",
                                            role: 0)
    visit root_path

    within '.acct-dropdown-menu' do
      click_link "Login"
    end
    expect(current_path).to eq login_path
    fill_in "Username", with: "Bob"
    fill_in "Password", with: "centrelli"
    click_button "Get Ur Scoot On"
    expect(current_path).to eq admin_dashboard_path

    visit dashboard_path(id: @user.id)

    expect(page).to_not have_link("Edit Profile")
  end
end
