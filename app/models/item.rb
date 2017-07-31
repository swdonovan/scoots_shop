class Item < ApplicationRecord
  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many :orders, through: :order_items
  has_many :order_items
  has_attached_file :image, styles: { small: "64x64",
                                      med: "100x100",
                                      large: "200x200"}

  enum role: [:active, :retired]
end
