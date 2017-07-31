require 'rails_helper'

RSpec.describe "Unauthenticated user" do
  scenario "user can't see others' private data" do

   visit orders_path

   expect(current_path).to eq(login_path)
   expect(page).to have_content("You must login to see your orders")
  end
  scenario "user should be redirected to login if tries to checkout" do

    visit root_path

    click_on "View Cart"
    expect(page).to have_link 'Login or Create Account to Checkout'
    click_on 'Login or Create Account to Checkout'
    expect(current_path).to eq(login_path)

  end
  scenario "unauthorized/unauthenticated user tries to access admin page" do

    visit admin_user_path(1)


    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end
end
