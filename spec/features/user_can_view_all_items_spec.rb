require 'rails_helper'

RSpec.feature "User can visit Items Index Page" do
  scenario "and sees all items" do
    item_1 = create(:item)
    item_2 = create(:item)
    item_3 = create(:item)

    visit '/items'

    within '.ProductIndexHeader' do
      expect(page).to have_content "All Products"
    end
# save_and_open_page
    expect(page).to have_content item_1.title
    expect(page).to have_content item_2.price
    expect(page).to have_content item_3.description
    expect(page).to have_content item_3.image
  end
end
