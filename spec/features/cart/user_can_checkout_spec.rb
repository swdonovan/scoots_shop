require 'rails_helper'

RSpec.feature 'User vists a full cart' do
  scenario 'and can check out and sees their orders' do
    user_attributes = {
                        username: "scootmaster",
                        password: "scootin",
                        address: "gettysburg",
                        email: "jwbooth@fordstheater.com"
                      }
    user = User.create(user_attributes)

    item1, item2 = create_list(:item, 2)
    cart = Cart.new({})
    cart.add_item(item1.id)
    cart.add_item(item1.id)
    cart.add_item(item2.id)

    visit cart_path
    # And I click "Login or Register to Checkout"
    click_on 'Login or Create Account to Checkout'

    expect(current_path).to eq(login_path)

    fill_in 'session[username]', with: user.username
    fill_in 'session[password]', with: user_attributes[:password]
    click_on 'Get Ur Scoot On'

    visit cart_path

    click_on 'Checkout'

    expect(current_path).to eq orders_path
    expect(page).to have_content 'Order was successfully placed'
    within ('.orders-table') do
      expect(page).to have_content Order.last.created_at
    end
  end
end
