class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  accepts_nested_attributes_for :order_items
  enum status: [:ordered, :paid, :cancelled, :completed]
  before_save :set_resolved

  def total_price
    order_items.sum(:line_item_total)
  end

  def self.count_by_status
    Order.group(:status).count
  end

  def self.sorted_orders(sort_by)
    Order.where(status: sort_by)
  end

  private

  def set_resolved
    if self.completed? || self.cancelled?
      self.resolved_at = Time.now
    end
  end
end
