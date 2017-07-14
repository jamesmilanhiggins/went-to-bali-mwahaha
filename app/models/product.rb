class Product < ApplicationRecord
  has_many :order_items

  validates :price, numericality: {greater_than: 0}
  validates :name, :description, :price, :presence => true
end
