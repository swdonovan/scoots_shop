class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  accepts_nested_attributes_for :order_items

  enum status: [:ordered, :paid, :cancelled, :completed]

  def total_price
    order_items.sum(:line_item_total)
  end

  def self.count_by_status
    Order.group(:status).count
  end

  def self.sorted_orders(sort_by='all')
    if sort_by == 'ordered'
      Order.ordered
    elsif sort_by == 'paid'
      Order.paid
    elsif sort_by == 'cancelled'
      Order.cancelled
    elsif sort_by == 'completed'
      Order.completed
    else
      Order.all
    end
  end
end
