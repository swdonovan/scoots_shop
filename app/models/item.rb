class Item < ApplicationRecord
  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many :orders, through: :order_items
  has_many :order_items

  has_attached_file :image, styles: { small: "50x50", med: "100x100", large: "650x650"}, default_url: "/images/:style/bazooka-vespa.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :categories, presence: true
  validates :title, presence: true, uniqueness: true
  validates_presence_of :description, :price

  validates_numericality_of :price

  enum role: [:active, :retired]
end
