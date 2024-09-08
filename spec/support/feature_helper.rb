module FeatureHelper 

  def user_login
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    debugger
    click_button'Log in'
  end

end