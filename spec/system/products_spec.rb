require 'rails_helper'

RSpec.describe "Products", type: :system do
  context 'when creating a new one' do
    before do
      login_as(create(:admin))
      visit new_admin_product_url
      find('#add-product-button').click
    end

    it 'is successfully with valid attributes' do
      fill_in 'product_name', with: 'test_product'
      fill_in 'product_price', with: '100'
      click_button 'Create Product'

      expect(page).to have_content 'Product added successfully'
    end


    it 'fails with missing name' do
      fill_in 'product_price', with: '100'
      click_button 'Create Product'

      expect(page).to have_content 'Name can\'t be blank'
    end

    it 'fails with missing price' do
      fill_in 'product_name', with: 'test_product'
      click_button 'Create Product'

      expect(page).to have_content 'Price can\'t be blank'
    end
  end
end
