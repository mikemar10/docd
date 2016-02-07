require 'rails_helper'

feature 'User visits homepage' do
  scenario 'user is logged out' do
    visit root_path

    expect(page).to have_css 'a.navbar-right', text: 'SIGN IN'
  end

  scenario 'user is logged in' do
    visit root_path
    sign_up_new_user 'test@example.com', 'testpassword'
    expect(page).to have_css 'a.navbar-right', text: 'test@example.com'
  end
end
