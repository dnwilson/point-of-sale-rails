require 'rails_helper'

RSpec.describe "sale_items/new", type: :view do
  before(:each) do
    assign(:sale_item, SaleItem.new(
      product: nil,
      sale: nil,
      quantity: 1,
      subtotal: "9.99",
      total: "9.99"
    ))
  end

  it "renders new sale_item form" do
    render

    assert_select "form[action=?][method=?]", sale_items_path, "post" do

      assert_select "input[name=?]", "sale_item[product_id]"

      assert_select "input[name=?]", "sale_item[sale_id]"

      assert_select "input[name=?]", "sale_item[quantity]"

      assert_select "input[name=?]", "sale_item[subtotal]"

      assert_select "input[name=?]", "sale_item[total]"
    end
  end
end
