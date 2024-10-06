require 'rails_helper'

RSpec.describe "sale_items/index", type: :view do
  before(:each) do
    assign(:sale_items, [
      SaleItem.create!(
        product: nil,
        sale: nil,
        quantity: 2,
        subtotal: "9.99",
        total: "9.99"
      ),
      SaleItem.create!(
        product: nil,
        sale: nil,
        quantity: 2,
        subtotal: "9.99",
        total: "9.99"
      )
    ])
  end

  it "renders a list of sale_items" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end
