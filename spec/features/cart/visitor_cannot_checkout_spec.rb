require 'rails_helper'

RSpec.feature 'Visitor visits the cart page' do
  scenario 'and cannot checkout without signing in' do
    item1, item2, item3 = create_list(:item, 3)
    total = item1.price + item3.price

    visit root_path

    click_button "Add to Cart", match: :first
    page.find("#item-#{item3.id}").click
    click_on "View Cart"

    expect(page).to have_button 'Login or Create Account to Checkout'
    click_button 'Login or Create Account to Checkout'

    fill_in 'user[username]', with: 'scootsmaster'
    fill_in 'user[email]', with: 'i_toot_scoots@scooteron.com'
    fill_in 'user[password]', with: 'password'

    click_on 'Get Ur Scoot On'

    click_on 'View Cart'

    expect(page).to have_css("img[src='#{item1.image}']")
    expect(page).to have_css("img[src='#{item3.image}']")
    expect(page).to have_content(item1.title)
    expect(page).to have_content(item3.title)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item3.description)
    expect(page).to have_content(item1.price)
    expect(page).to have_content(item3.price)
    expect(page).to have_content("Total Price: $#{total}")
  end
end
