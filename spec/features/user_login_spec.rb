# spec/features/user_login_spec.rb
require 'rails_helper'

RSpec.feature "User Login", type: :feature do
  let(:user) { create(:user) }
  subject do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end
  scenario "User logs in with valid credentials" do
    subject
    debugger
    expect(page).to have_content(user.name)
  end
end
