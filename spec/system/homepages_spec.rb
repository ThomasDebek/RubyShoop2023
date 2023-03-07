require 'rails_helper'

RSpec.describe "Homepages", type: :system do


  before  do
    category_1 = FactoryBot.create(:category, name: 'category_1')
    category_2 = FactoryBot.create(:category, name: 'category_2')

    FactoryBot.create(:product, name: 'product_1', category: category_1)
    FactoryBot.create(:product, name: 'product_2', category: category_2)
  end

  it "displays all available Products" do
    visit "/"

    expect(page).to have_text("product_1")
    expect(page).to have_text("product_2")
    assert_selector "h4.card-title", text: "product_1"
    assert_selector "h4.card-title", text: "product_2"
    assert_selector "h4.card-title", count: 2
  end

  it 'displays only Products from chosen category' do
    visit '/'
    click_on 'category_1'

    assert_selector 'h4.card-title', text: 'product_1'
    assert_selector 'h4.card-title', count: 1
  end

end
