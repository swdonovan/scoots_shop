require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "instance methods" do
    describe "#add items" do
      it "should add items to the cart" do
        cart = Cart.new({})
        cart.add_item(3)
        cart.add_item(2)
        cart.add_item(3)

        expected = {"3" => 2, "2" => 1}

        expect(cart.contents).to eq expected
      end
    end

    describe '#remove_item' do
      it "should remove item from contents" do
        cart = Cart.new({})
        cart.add_item(3)
        cart.add_item(2)
        cart.add_item(3)

        cart.remove_item(2)

        expected = {"3" => 2}

        expect(cart.contents).to eq(expected)
      end
    end

    describe '#quantity' do
      it 'should display the quantity of items' do
        cart = Cart.new({"3" => 2, "2" => 1})

        expect(cart.quantity(3)).to eq(2)
      end
    end

    describe '#increase_item' do
      it 'should increase the quantity of an item' do
        cart = Cart.new({"3" => 2, "2" => 1})
        cart.increase_item(3)

        expect(cart.quantity(3)).to eq 3
      end

      describe '#decrease_item' do
        it 'should decrease the quantity of an item' do
          cart = Cart.new({"3" => 2, "2" => 1})
          cart.decrease_item(3)

          expect(cart.quantity(3)).to eq 1
        end
      end

      describe '#order_items_attributes' do
        it "returns an array of order item attributes" do
          item1, item2 = create_list(:item, 2)
          cart = Cart.new({})
          cart.add_item(item1.id)
          cart.add_item(item1.id)
          cart.add_item(item2.id)

          result = cart.order_items_attributes

          expected = [
            {item_id: item1.id, item_quantity: 2, line_item_total: item1.price * 2},
            {item_id: item2.id, item_quantity: 1, line_item_total: item2.price * 1}
          ]

          expect(result).to eq (expected)
        end
      end
    end
  end
end
