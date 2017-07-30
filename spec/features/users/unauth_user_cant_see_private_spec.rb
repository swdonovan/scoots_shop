require 'rails_helper'

RSpec.describe "Unauthenticated user" do
  scenario "user can't see others' private data" do

   visit orders_path

   expect(current_path).to eq(login_path)
   expect(page).to have_content("You must login to see your orders")
  end
  skip "user should be redirected to login if tries to checkout" do
    #this is dependent on user story 15 (checkout)

    #code:
    #visit checkout or whatever
    #redireted to login page


  end
  scenario "unauthorized/unauthenticated user tries to access admin page" do

    visit admin_user_path(1)


    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end
end
