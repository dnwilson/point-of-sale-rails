class Sale < ApplicationRecord
  has_many :sale_items, dependent: :destroy
  has_many :products, through: :sale_items

  accepts_nested_attributes_for :sale_items, allow_destroy: true, reject_if: :all_blank

  before_save :update_totals


  private

  def update_totals
    sale_items.each(&:update_totals)

    self.total = sale_items.sum(&:subtotal)
    self.balance = self.total - self.tendered
  end
end
