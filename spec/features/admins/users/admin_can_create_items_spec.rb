require 'rails_helper'

# As an authenticated Admin: I can create an item.
describe 'Admin can create an item' do
  scenario 'from link on admin dashboard' do
    admin = User.create(username: 'scootypuff',
                        email: 'scootypuff@scoots.com',
                        password: 'hmmmmmmmm',
                        role: 1)
    cat1 = Category.create(name: "Cross Country")
    Category.create(name: "Crosstown")
    Category.create(name: "Sport")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    admin.admin!
    visit admin_dashboard_path(id: admin.id)

    expect(page).to have_link 'Create New Item'
    click_link 'Create New Item'

    expect(current_path).to eq new_admin_item_path

    fill_in 'item[title]', with: 'Scoot scoot scoot'
    fill_in 'item[description]', with: 'all over the place'
    fill_in 'item[price]', with: 199.99

    check "Cross Country"
    # save_and_open_page
    click_button 'Create Item'

    item = Item.last


    expect(current_path).to eq item_path(item.id)
    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price)
    expect(page).to have_content(item.categories.last.name)
# The photo is optional. If not present, a stand-in photo is used. (PAPERCLIP)
    # expect(page).to have_css PAPERCLIP image
  end
end

# (model test)
# An item must have a title, description and price.
# An item must belong to at least one category.
# The title and description cannot be empty.
# The title must be unique for all items in the system.
# The price must be a valid decimal numeric value and greater than zero.
