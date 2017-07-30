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
end
