require 'rails_helper'

RSpec.describe "Delete Products", type: :system do
  context 'when logged in as admin' do
    let!(:admin) { create(:admin) }
    let!(:product) { create(:product) }

    before do
      login_as(admin, scope: :admin)
      visit admin_products_path
    end

    context 'when deleting product' do
      before do
        find("#delete-product-#{product.id}-button").click
      end

      it 'deletes product successfully' do
        expect(page).to have_content 'Product deleted successfully'
      end

      it 'removes product from product index' do
        expect(page).not_to have_content product.name
      end
    end
  end
end



