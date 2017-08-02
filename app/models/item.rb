class Item < ApplicationRecord
  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many :orders, through: :order_items
  has_many :order_items
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200"}, default_url: "http://static.neatorama.com/images/2014-04/bazooka-vespa.jpg"
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :categories, presence: true
  validates :title, presence: true, uniqueness: true
  validates_presence_of :description, :price

  validates_numericality_of :price

  enum role: [:active, :retired]
end
