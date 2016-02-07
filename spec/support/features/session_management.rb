module Features
  def sign_up_new_user(email, password)
    visit root_path
    click_on 'SIGN IN'
    click_on 'Sign up'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Sign up'
  end

  def sign_out_user
    click_on 'SIGN OUT'
  end

  def sign_in_user(email, password)
    visit root_path
    click_on 'SIGN IN'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Sign in'
  end
end
