require 'rails_helper'

RSpec.describe 'POST/cart', type: :request do
  context 'when logged in as user' do
    let!(:product) {create(:product)}
    let!(:user) { create(:user) }

    before do
      login_as(user, scope: :user)
    end

    it 'creates new LineItem' do
      expect do
        post '/cart', params: { product_id: product.id }
      end.to change(LineItem, :count).by(1)
    end

  end


  context 'when not logged in user' do
    let!(:product) { create(:product)}

    it 'does not create LineItem' do
      expect do
        post '/cart', params: { product_id: product.id }
      end.not_to change(LineItem, :count )
    end
  end


end