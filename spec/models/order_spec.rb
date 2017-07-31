require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "instance methods" do
    describe "#total_price" do
      it "should return the total order price" do
        user = create(:user)
        item1, item2 = create_list(:item, 2)
        order = create(:order, user_id: user.id)
        order.items << [item1, item2]
        item1, item2 = order.order_items
        item1.item_quantity = 2
        item2.item_quantity = 1
        item1.line_item_total = item1.item_quantity * item1.item.price
        item2.line_item_total = item2.item_quantity * item2.item.price
        order.save
        item1.save
        item2.save
        expected = item1.line_item_total + item2.line_item_total

        expect(order.total_price).to eq(expected)
      end
    end
  end

  describe 'class methods' do
    describe '.count_by_status' do
      it "should return a hash of statuses with the total counts" do
        user = create(:user)
        order1 = create(:order, :with_items, user_id: user.id)
        order2 = create(:order, :with_items, user_id: user.id)
        paid_orders = create_list(:order, 2, status: 1, user_id: user.id)
        cancelled_ordrs = create_list(:order, 3, status: 2, user_id: user.id)
        completed_orders = create_list(:order, 1, status: 3, user_id: user.id)

        expected = {
          'ordered' => 2,
          'paid' => 2,
          'cancelled' => 3,
          'completed' => 1
        }

        expect(Order.count_by_status).to eq(expected)
      end
    end

    describe '.sorted_orders' do
      let(:user)  { create(:user) }
      let(:order1) { create(:order, :with_items, user_id: user.id) }
      let(:order2) { create(:order, :with_items, user_id: user.id) }
      let(:paid_orders) { create_list(:order, 2, status: 1, user_id: user.id) }
      let(:cancelled_ordrs) { create_list(:order, 3, status: 2, user_id: user.id) }
      let(:completed_orders) { create_list(:order, 1, status: 3, user_id: user.id) }

      it "should return all orders by default" do
        result = Order.sorted_orders

        expect(result).to eq(Order.all)
      end

      it "should return only orders that with status of order" do
        result = Order.sorted_orders('ordered')

        expect(result).to eq([order1, order2])
      end
    end
  end
end
