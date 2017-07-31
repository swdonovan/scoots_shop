require 'rails_helper'

RSpec.feature 'User visits an individual item show page' do
  scenario 'and sees information for that item' do
    item = create(:item)

    visit item_path(item)

    expect(current_path).to eq "/items/#{item.id}"
    expect(page).to have_content item.title
    expect(page).to have_content item.description
    expect(page).to have_css "img[src='#{item.image}']"
    expect(page).to have_content item.price
    expect(page).to have_content item.role
    expect(page).to have_button "Add to Cart"
    expect(page).to_not have_button 'Item Retired', disabled: true
  end
end
