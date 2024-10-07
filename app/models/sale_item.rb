class SaleItem < ApplicationRecord
  belongs_to :product
  belongs_to :sale

  delegate :name, :price, to: :product, prefix: true, allow_nil: true
  
  before_save :update_totals

  def update_totals
    self.subtotal = self.product_price * self.quantity
    self.total = self.subtotal
  end
end
