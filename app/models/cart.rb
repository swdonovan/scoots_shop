class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_item(item)
    @contents[item.to_s] = (@contents[item.to_s] || 0) + 1
  end

  def total_price
    sum = @contents.keys.inject(0) do |sum, key|
      sum += (@contents[key] * Item.find(key).price)
    end
  end

  def remove_item(item_id)
    @contents.delete(item_id.to_s)
  end

  def quantity(item_id)
    @contents[item_id.to_s]
  end

  def increase_item(item_id)
    @contents[item_id.to_s] += 1
  end

  def decrease_item(item_id)
    @contents[item_id.to_s] -= 1
  end


  def cart_items
    @items = Item.find(@contents.keys)
  end

  def order_items_attributes
    @contents.map do |id, quantity|
      price = Item.find(id).price
      {
        item_id: id.to_i,
        item_quantity: quantity,
        line_item_total: quantity * price
      }
    end
  end
end
