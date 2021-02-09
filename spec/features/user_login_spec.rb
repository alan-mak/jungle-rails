require 'rails_helper'

RSpec.feature 'Visitor adds to shopping cart', type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'Alan',
      last_name: 'Mak',
      email: 'abc@gmail.com',
      password: 'abc',
      password_confirmation: 'abc'
    )
  end

  scenario 'Login and Logout as User' do
    # Arrive at login page
    visit '/login'
    # Screenshot before login
    save_screenshot '4a.png'
    # Login to site
    fill_in 'email', with: 'abc@gmail.com'
    fill_in 'password', with: 'abc'
    # Select login button
    click_on 'Submit'
    # Screenshot after login
    sleep(1)
    save_screenshot '4b.png'
    # Should show logged in as
    expect(page).to have_content('Signed in as: abc@gmail.com')
    expect(page).not_to have_content('Login')
    # Select logout
    click_on 'Logout'
    # Should show login and register
    sleep(1)
    save_screenshot '4c.png'
    expect(page).to have_content('Register')
    expect(page).to have_content('Login')
  end

end