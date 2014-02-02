require 'spec_helper'

feature 'available mentors and users seeking mentor show on page', %Q{
  As a signed in user
  I want to see users giving and seeking mentorship
  So that I receive/give mentorship
} do

  scenario 'user shows up when giving mentorship' do
    user = FactoryGirl.create(:user, first_name: 'jack', giving_mentorship: true,
      seeking_mentorship: false)
    user2 = FactoryGirl.create(:user, first_name: 'larry', giving_mentorship: false,
      seeking_mentorship: true)
    sign_in_as(user2)
    click_on 'Find Mentorship'
    expect(page).to have_content(user.first_name)
  end

  scenario 'user shows up when seeking mentorship' do
    user = FactoryGirl.create(:user, first_name: 'jack', giving_mentorship: true,
      seeking_mentorship: false)
    user2 = FactoryGirl.create(:user, first_name: 'larry', giving_mentorship: false,
      seeking_mentorship: true)
    sign_in_as(user)
    click_on 'Find Mentorship'
    expect(page).to have_content(user2.first_name)
  end

  scenario 'current user does not show on list' do
    user = FactoryGirl.create(:user, first_name: 'jack', giving_mentorship: true,
      seeking_mentorship: false)
    user2 = FactoryGirl.create(:user, first_name: 'larry', giving_mentorship: false,
      seeking_mentorship: true)
    sign_in_as(user)
    click_on 'Find Mentorship'
    expect(page).to_not have_content(user.first_name)
  end  
end
