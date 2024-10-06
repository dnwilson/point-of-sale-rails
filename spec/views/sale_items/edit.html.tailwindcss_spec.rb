require 'rails_helper'

RSpec.describe "sale_items/edit", type: :view do
  let(:sale_item) {
    SaleItem.create!(
      product: nil,
      sale: nil,
      quantity: 1,
      subtotal: "9.99",
      total: "9.99"
    )
  }

  before(:each) do
    assign(:sale_item, sale_item)
  end

  it "renders the edit sale_item form" do
    render

    assert_select "form[action=?][method=?]", sale_item_path(sale_item), "post" do

      assert_select "input[name=?]", "sale_item[product_id]"

      assert_select "input[name=?]", "sale_item[sale_id]"

      assert_select "input[name=?]", "sale_item[quantity]"

      assert_select "input[name=?]", "sale_item[subtotal]"

      assert_select "input[name=?]", "sale_item[total]"
    end
  end
end
