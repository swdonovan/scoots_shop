require 'rails_helper'

describe "Admin can login and see they are an admin" do
  scenario "their dashboard shows that they are an admin" do
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

    within '.acct-dropdown-menu' do
      click_link "Admin Dashboard"
    end
    expect(current_path).to eq admin_dashboard_path
  end

  describe "User can not view admin dashboard" do
    scenario "instead they are redirected to the login page" do
      @user = User.create(username: "Cletus", email: "cl@etus", password: "centrelli")

      visit root_path

      within '.acct-dropdown-menu' do
        click_link "Login"
      end

      expect(current_path).to eq login_path
      fill_in "Username", with: "Cletus"
      fill_in "Password", with: "centrelli"
      click_button "Get Ur Scoot On"
      expect(current_path).to eq dashboard_path

      visit admin_dashboard_path

      expect(page).to have_content '404'
    end
  end

  describe "User can not hack into admin dashboard" do
    scenario "instead they are redirected to the login page" do
      @user = User.create(username: "Cletus", email: "cl@etus", password: "centrelli")

      visit root_path

      within '.acct-dropdown-menu' do
        click_link "Login"
      end

      expect(current_path).to eq login_path
      fill_in "Username", with: "Cletus"
      fill_in "Password", with: "centrelli"
      click_button "Get Ur Scoot On"
      expect(current_path).to eq dashboard_path

      within '.acct-dropdown-menu' do
        expect(page).to_not have_content "Admin Dashboard"
      end

      # visit '/admin/users/2'
      # expect(current_path).to eq login_path
      # this works and kicks a user out, testing won't represent it.
    end
  end
end
