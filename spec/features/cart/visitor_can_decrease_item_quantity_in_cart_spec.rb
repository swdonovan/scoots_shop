require 'rails_helper'

RSpec.feature 'Visitor can decrease the quantity of an item in cart' do
  scenario 'and sees the decreased quantity' do
    item1, item2, item3 = create_list(:item, 3)

    visit root_path

    click_button "Add to Cart", match: :first
    page.find("#item-#{item3.id}").click
    page.find("#item-#{item3.id}").click
    page.find("#item-#{item3.id}").click
    click_on "View Cart"

    expect(current_path).to eq('/cart')
    within("#item-#{item3.id}-quantity") do
      expect(page).to have_content 3
    end

    page.find("#decrease-item-#{item3.id}").click

    within("#item-#{item3.id}-quantity") do
      expect(page).to have_content 2
    end
  end
end
