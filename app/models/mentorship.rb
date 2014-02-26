class Mentorship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User", foreign_key: "friend_id"

  validates_presence_of :user_id, :friend_id


  def self.exists?(user, friend)
    find_by_user_id_and_friend_id(user,friend) != nil
  end

  def self.request(user, friend, giving_mentorship)
    unless user == friend || exists?(user, friend)
      if giving_mentorship == true
        transaction do
          create(user: user, friend: friend, status: 'pending', giving_mentorship: true)
          create(user: friend, friend: user, status: 'requested', giving_mentorship: false)
        end
      else
        transaction do
          create(user: user, friend: friend, status: 'pending', giving_mentorship: false)
          create(user: friend, friend: user, status: 'requested', giving_mentorship: true)
        end
      end
    end
  end

    def self.accept(user, friend)
      transaction do
        accepted_at = Time.now
        accept_one_side(user, friend, accepted_at)
        accept_one_side(friend, user, accepted_at)
      end
    end

    def self.end_mentorship(user, friend)
      transaction do
        destroy(find_by_user_id_and_friend_id(user, friend))
        destroy(find_by_user_id_and_friend_id(friend, user))
      end
    end

    private

    def self.accept_one_side(user, friend, accepted_at)
      request = find_by_user_id_and_friend_id(user, friend)
      request.status = 'accepted'
      request.accepted_at = accepted_at
      request.save!
    end
end
