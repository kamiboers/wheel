require 'rails_helper'

RSpec.describe 'user login', type: :feature do
  it 'redirects unauthenticated user to login/signup page' do
    visit root_path

    expect(page).to have_link('Log In')
    expect(page).to have_link('Sign Up')
  end

  it 'allows new user to create account' do
    visit root_path
    click_on 'Sign Up'
    fill_in 'user_username', with: 'Nacho'
    fill_in 'user_email', with: 'nacho@nacho.com'
    fill_in 'user_password', with: 'password'
    click_on 'Create Account'

    expect(current_path).to eq('/dashboard')
    expect(current_page).to have_content('Welcome to Wheel of Chorechun, Nacho')
    expect(current_page).to have_content('Your Chores')
    expect(User.last.username).to eq('Nacho')
  end

end