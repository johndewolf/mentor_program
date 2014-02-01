require 'spec_helper'

feature 'user sign up', %Q{
  As an unautheticated user
  I want to sign up
  So that I can use the service
} do
  scenario 'with valid and required attributes' do
    visit root_path
    click_link "Sign Up"
    fill_in 'First name', with: 'test'
    fill_in 'Last name', with: 'test'
    fill_in 'Email', with: 'test@aol.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    select 'Winter 2013', from: 'Cohort'
    click_button 'Sign up'
    expect(page).to have_content("Welcome! You have signed up successfully" )
  end
end
