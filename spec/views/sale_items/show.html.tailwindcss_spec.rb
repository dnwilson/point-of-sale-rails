require 'rails_helper'

RSpec.describe "sale_items/show", type: :view do
  before(:each) do
    assign(:sale_item, SaleItem.create!(
      product: nil,
      sale: nil,
      quantity: 2,
      subtotal: "9.99",
      total: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
