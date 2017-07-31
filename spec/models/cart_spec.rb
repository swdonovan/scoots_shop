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
    end
  end
end
