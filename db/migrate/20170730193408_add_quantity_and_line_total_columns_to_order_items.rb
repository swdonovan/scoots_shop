class AddQuantityAndLineTotalColumnsToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :item_quantity, :integer
    add_column :order_items, :line_item_total, :decimal
  end
end
