require 'rails_helper'

RSpec.feature 'Admin edits an item' do
  scenario 'and sees the updated information' do
    items = create_list(:item, 3)
    admin = create(:admin)
    # As an admin
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(admin)
    # When I visit "admin/items"
    visit admin_items_path
    # And I click "Edit"
    click_on 'Edit', match: :prefer_exact
    # Then my current path should be "/admin/items/:ITEM_ID/edit"
    expect(current_path).to eq edit_admin_item_path(items.first)
    # And I should be able to update title, description, image, and status
    fill_in 'item[title]', with: 'Scoot scoot scoot'
    fill_in 'item[description]', with: 'all over the place'
    fill_in 'item[price]', with: 199.99
    select 'retired', from: 'item[role]'
    page.attach_file('item_image', Rails.root + 'app/assets/images/bazooka-vespa.png')

    click_on 'Update Item'

    expect(current_path).to eq admin_item_path(items.first)
    expect(page).to have_content 'Item updated successfully'
    expect(page).to have_content 'Scoot scoot scoot'
    expect(page).to have_content 'all over the place'
    expect(page).to have_content 199.99
    expect(page).to have_content 'retired'
  end
end
