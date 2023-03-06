require 'rails_helper'

RSpec.describe "Homepages", type: :system do


  before  do
    product1 = FactoryBot.create(:product, name: 'product_1')
    product2 = FactoryBot.create(:product, name: 'product_2')
  end

  it "displays all available Products" do
    visit "/"

    expect(page).to have_text("product_1")
    expect(page).to have_text("product_2")
    assert_selector "h4.card-title", text: "product_1"
    assert_selector "h4.card-title", text: "product_2"
    assert_selector "h4.card-title", count: 2
  end


end
