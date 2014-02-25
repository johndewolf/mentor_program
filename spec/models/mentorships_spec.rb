require 'spec_helper'

describe Mentorship do
  let (:user) { FactoryGirl.create(:user) }
  let (:friend) { FactoryGirl.create(:user, giving_mentorship: false,
    seeking_mentorship: true) }

  describe "#request" do
    context "the mentorship is requested" do
      it "creates a new request" do
        Mentorship.request(user, friend)
        expect(Mentorship.exists?(user, friend)).to eql(true)
      end

      it "adds the requestor and the requestee to the model" do
        Mentorship.request(user, friend)
        expect(Mentorship.find_by_user_id_and_friend_id(user, friend).status).to eql('pending')
        expect(Mentorship.find_by_user_id_and_friend_id(friend, user).status).to eql('requested')
      end
    end
  end

  describe "#accept" do
    context "user can accept mentorship" do
      it "updates Mentorship from pending to accepted" do
        Mentorship.request(user, friend)
        Mentorship.accept(user, friend)
        expect(Mentorship.find_by_user_id_and_friend_id(user, friend).status).to eql('accepted')
      end
    end
  end

  describe "#end_mentorship" do
    context "user ends mentorship" do
      it "destroyed hte mentorship" do
        Mentorship.request(user, friend)
        Mentorship.end_mentorship(user, friend)
        expect(Mentorship.all.count).to eql(0)
      end
    end
  end

end
