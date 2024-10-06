require 'rails_helper'

RSpec.describe "sales/index", type: :view do
  before(:each) do
    assign(:sales, [
      Sale.create!(
        total: "9.99"
      ),
      Sale.create!(
        total: "9.99"
      )
    ])
  end

  it "renders a list of sales" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end
