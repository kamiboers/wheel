require "rails_helper"

RSpec.describe "user login", type: :feature do
  it "redirects unauthenticated user to login/signup page" do
    visit root_path

    expect(page).to have_link("Log In")
    expect(page).to have_link("Sign Up")
  end

  it "allows new user to create account" do
    visit root_path
    click_on "Sign Up"
    fill_in "user_username", with: "NachoNacho"
    fill_in "user_email", with: "nacho@nacho.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_on "Create Account"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome, NachoNacho")
    expect(page).to have_content("Today's Assignment")
    expect(User.last.username).to eq("NachoNacho")
  end

  it "rejects sign up with invalid email address" do
    visit root_path
    click_on "Sign Up"
    fill_in "user_username", with: "Burrito"
    fill_in "user_email", with: "burrito@burrito"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_on "Create Account"

    expect(page).to have_content("Email is invalid")
    expect(page).to have_content("Please Sign Up to Continue")
    expect(User.count).to eq(0)
  end

  it "rejects sign up with incorrect password confirmation" do
    visit root_path
    click_on "Sign Up"
    fill_in "user_username", with: "TacoTaco"
    fill_in "user_email", with: "taco@taco.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "wrong"
    click_on "Create Account"

    expect(page).to have_content("Password confirmation doesn't match password")
    expect(page).to have_content("Please Sign Up to Continue")
    expect(User.count).to eq(0)
  end

  it "rejects sign up with password under 8 characters" do
    visit root_path
    click_on "Sign Up"
    fill_in "user_username", with: "TacoTaco"
    fill_in "user_email", with: "taco@taco.com"
    fill_in "user_password", with: "short"
    fill_in "user_password_confirmation", with: "short"
    click_on "Create Account"

    expect(page).to have_content("Password is too short")
    expect(page).to have_content("Please Sign Up to Continue")
    expect(User.count).to eq(0)
  end


  it "rejects sign up with username under 8 characters" do
    visit root_path
    click_on "Sign Up"
    fill_in "user_username", with: "Taco"
    fill_in "user_email", with: "taco@taco.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_on "Create Account"

    expect(page).to have_content("Username is too short")
    expect(page).to have_content("Please Sign Up to Continue")
    expect(User.count).to eq(0)
  end

end