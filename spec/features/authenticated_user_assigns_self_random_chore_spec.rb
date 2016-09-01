require "rails_helper"

RSpec.describe "chore generation", type: :feature do
  
  it "redirects unauthenticated user to login/signup page" do
    user = login_user
    visit "/"

    click_on "Spin the Wheel"

    within("#assignment") do
        expect(page).to have_content("Your Chore:")
        expect(page).to have_content(user.chore.title)
    end

    expect(page).not_to have_content("Spin the Wheel")

  end

end