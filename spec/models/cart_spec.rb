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
  end
end
