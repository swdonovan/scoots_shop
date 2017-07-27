require 'rails_helper'

RSpec.feature "Visitor can remove items from their cart" do
  scenario "and not see the removed items in their cart" do
    item1, item2, item3 = create_list(:item, 3)

    visit root_path

    click_button "Add to Cart", match: :first
    page.find("#item-#{item3.id}").click
    click_on "View Cart"

    page.find("#remove-item-#{item3.id}").click

    expect(page).to have_content("Successfully removed #{item3.title} from your cart.")
    expect(page).to have_link "#{item3.title}"
    expect(current_path).to eq('/cart')
    expect(page).to have_css("img[src='#{item1.image}']")
    expect(page).to have_content(item1.title)
    expect(page).to have_content(item1.description)
    expect(page).to_not have_content(item3.description)
    expect(page).to have_content(item1.price)
    expect(page).to_not have_content(item3.price)
    expect(page).to have_content("Total Price: $#{item1.price}")
  end
end
