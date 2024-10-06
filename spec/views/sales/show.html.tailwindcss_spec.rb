require 'rails_helper'

RSpec.describe "sales/show", type: :view do
  before(:each) do
    assign(:sale, Sale.create!(
      total: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
  end
end
