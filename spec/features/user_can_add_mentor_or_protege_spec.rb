require 'spec_helper'

feature 'user can add mentor or give mentorship', %Q{
  As an authenticated user,
  I want to send a request for mentorship or request to mentor
  So that I can provide or receive mentorship
} do

  scenario 'user sends request for mentorship' do
    FactoryGirl.create(:user, first_name: 'jack', giving_mentorship: true,
      seeking_mentorship: false)
    user2 = FactoryGirl.create(:user, first_name: 'larry', giving_mentorship: false,
      seeking_mentorship: true)
    sign_in_as(user2)
    click_on 'Find Mentorship'
    click_on 'Request Mentorship'
    expect(page).to have_content('Mentorship Request Sent!')
    expect
  end
end
