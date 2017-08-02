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
    expect(current_path).to eq dashboard_path

    visit admin_user_path(@admin)

    click_on "Edit Info"

    expect(current_path).to eq(edit_admin_user_path(@admin))
    expect(page).to have_content("Bob")
    # save_and_open_page
    fill_in "Username", with: "Bobby"
    # save_and_open_page
    click_on "Update your scoot-game"

    expect(current_path).to eq(admin_dashboard_path(@admin))
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
      expect(current_path).to eq dashboard_path

      visit admin_user_path(@user)

      expect(page).to_not have_content("edit")

  end
end
