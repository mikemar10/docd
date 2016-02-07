require 'rails_helper'

feature 'A new user signs up' do
  scenario 'successfully' do
    credentials = %w[test@example.com password]
    visit root_path
    sign_up_new_user *credentials
    sign_out_user
    sign_in_user *credentials

    expect(page).to have_css 'a.navbar-right', text: 'test@example.com'
  end

  scenario 'unsuccessfully due to the user already existing' do
    credentials = %w[test@example.com password]
    visit root_path
    sign_up_new_user *credentials
    sign_out_user
    sign_up_new_user *credentials

    #expect(page).to have_css
  end
end
