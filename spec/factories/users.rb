FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@aol.com" }
    first_name 'jack'
    last_name 'd'
    password 'applepie'
    password_confirmation 'applepie'
    cohort 'winter 2013'
    giving_mentorship true
    seeking_mentorship false
  end
end
