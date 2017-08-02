require 'rails_helper'

RSpec.feature 'Admin visits the admin orders index' do
  scenario 'and see all the orders and can filter them' do
    user = create(:user)
    order1 = create(:order, :with_items, user_id: user.id)
    order2 = create(:order, :with_items, user_id: user.id)
    paid_orders = create_list(:order, 2, status: 1, user_id: user.id)
    cancelled_ordrs = create_list(:order, 3, status: 2, user_id: user.id)
    completed_orders = create_list(:order, 1, status: 3, user_id: user.id)

    admin = create(:admin)

    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(admin)

    visit admin_dashboard_path

    user.orders.each do |order|
      expect(page).to have_content order.created_at
    end

    expect(page).to have_content "Ordered: 2"
    expect(page).to have_content "Paid: 2"
    expect(page).to have_content "Cancelled: 3"
    expect(page).to have_content "Completed: 1"

    expect(page).to have_link('View Order', href: order_path(order1))

    click_on 'Ordered'

    within('.table-ordered') do
      expect(page).to have_content order1.created_at
      expect(page).to have_content order2.created_at
      expect(page).to have_link 'Cancel'
      expect(page).to have_link 'Mark as Paid'
    end

    click_on 'Paid', match: :first

    within('.table-paid') do
      paid_orders.each do |order|
        expect(page).to have_content order.created_at
      end

      expect(page).to have_link 'Cancel'
      expect(page).to have_link 'Mark as Completed'
    end

    click_on 'Cancelled'

    within('.table-cancelled') do
      cancelled_ordrs.each do |order|
        expect(page).to have_content order.created_at
      end
    end

    click_on 'Completed'

    within('.table-completed') do
      completed_orders.each do |order|
        expect(page).to have_content order.created_at
      end
    end
  end
end
