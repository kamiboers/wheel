require "rails_helper"

RSpec.describe "user login", type: :feature do
  
  it "redirects unauthenticated user to login/signup page" do
    user = create_user
    visit root_path
    click_on "Log In"

    expect(current_path).to eq("/login")
    expect(page).to have_content("Log In to Continue")
    fill_in "username", with: user.username
    fill_in "password", with: 'password'
    click_on "Log In"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome, #{user.username}")
  end

  it "logs out authenticated user" do
    user = login_user
    visit root_path
    
    expect(current_path).to eq("/dashboard")

    click_on "Sign Out"

    expect(current_path).to eq("/")
    expect(page).to have_content("Log In or Sign Up")
    expect(page).not_to have_content("Sign Out")
  end

end