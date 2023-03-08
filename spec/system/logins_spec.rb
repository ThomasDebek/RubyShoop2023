require 'rails_helper'

RSpec.describe "Logins", type: :system do
  context 'when visiting the Home Page' do
    it 'Log In button is visible' do
      visit '/'

      expect(page).to have_link('Log In')
    end
  end

  context 'when wisiting the Sign Up Page' do
    it 'Log In buttons is visible' do
      visit '/'
      click_on('Sign Up')
      expect(page).to have_link('Log In')
    end
  end

end
