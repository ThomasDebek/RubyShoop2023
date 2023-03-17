require 'rails_helper'

RSpec.describe 'GET /admin', type: :request do
  let!(:user) { create(:user) }
  let!(:admin) { create(:admin) }
  let!(:product1) { create(:product, name: 'product1') }
  let!(:product2) { create(:product, name: 'product2') }

  context 'when logged in as admin' do
    before do
      login_as(admin, scope: :admin)
      get '/admin'
    end

    it 'is possible to access admin root path' do
      expect(response.body).to include('Admin Panel')
    end

    it 'is displaying all products' do
      expect(response.body).to include(product1.name).and include(product2.name)
    end
  end

  context 'when logged in as User' do
    before do
      login_as(user, scope: :user)
      get '/admin'
      follow_redirect!
    end

    it 'redirects to root path' do
      expect(response).to redirect_to(root_path)
    end

    it 'informs about lack of authorization' do
      follow_redirect!
      expect(response.body).to include('You are not authorized.')
    end
  end

  context 'when not logged in' do
    before do
      get '/admin'
      follow_redirect!
    end

    it 'redirects to root path' do
      expect(response).to redirect_to(root_path)
    end

    it 'informs about lack of authorization' do
      follow_redirect!
      expect(response.body).to include('You are not authorized.')
    end
  end
end
