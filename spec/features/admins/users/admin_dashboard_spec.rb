require 'rails_helper'

RSpec.describe "Accessing admin dashboard" do
  scenario "as an admin"  do


    user = User.create(username: "Bobby", email: "bob@bob", password: "centrelli",
                            role: 0)

    visit admin_dashboard_path

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
