class Product < ApplicationRecord
  has_one_attached :image

  has_many :sale_items, dependent: :destroy
  has_many :sales, through: :sale_items

  validates :name, presence: true, uniqueness: true
  validates :price, numericality: true
  validates :image, presence: true
end
