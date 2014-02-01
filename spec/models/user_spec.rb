require 'spec_helper'

describe User do
  it { should have_valid(:first_name).when('Larry') }
  it { should_not have_valid(:first_name).when('', nil) }
  
  it { should have_valid(:last_name).when('Bird') }
  it { should_not have_valid(:last_name).when('') }

  it { should have_valid(:email).when('birdman@aol.com') }
  it { should_not have_valid(:email).when(nil, '') }

  it { should have_valid(:cohort).when('Winter 2013') }
  it { should_not have_valid(:cohort).when('') }

  it { should have_valid(:seeking_mentorship).when(true) }
  it { should_not have_valid(:seeking_mentorship).when('') }

  it { should have_valid(:giving_mentorship).when(true) }
  it { should_not have_valid(:giving_mentorship).when('') }
end
