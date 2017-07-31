class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  accepts_nested_attributes_for :order_items

  enum status: [:ordered, :paid, :cancelled, :completed]

  def total_price
    order_items.sum(:line_item_total)
  end

end
