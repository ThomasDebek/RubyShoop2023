require 'rails_helper'

RSpec.describe "Admin Dashboard", type: :request do
  let!(:user) { create(:user) }
  let!(:admin) { create(:admin)}

  describe 'GET / admin' do
    context 'when not logged in' do
      it 'redirects to root path' do
        get '/admin'
        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(response.body).to include('You are not authorized')
      end
    end

    context 'when logged in as User' do
      it 'redirect to root path' do
        login_user(user)
        get "/admin"
        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(response.body).to include('You are not authorized')
      end
    end

    context 'when logged in as Admin' do
      it 'redirect to admin root path' do
        login_admin(admin)
        get '/admin'
        expect(response.body).to include('Admin Panel')
      end
    end

  end

end