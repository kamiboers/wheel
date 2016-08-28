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
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Create Account'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Welcome, Nacho')
    expect(page).to have_content('Your Chores')
    expect(User.last.username).to eq('Nacho')
  end

  it 'rejects sign up with invalid email address' do
    visit root_path
    click_on 'Sign Up'
    fill_in 'user_username', with: 'Burrito'
    fill_in 'user_email', with: 'burrito@burrito'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Create Account'

    expect(page).to have_content('Email is invalid.')
    expect(page).to have_content('Please Sign Up to Continue')
    expect(User.count).to eq(0)
  end

end