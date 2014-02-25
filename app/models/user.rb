class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :cohort
  validates_inclusion_of :giving_mentorship, in: [true, false]
  validates_inclusion_of :seeking_mentorship, in: [true, false]

  has_many :mentorships
  has_many :friends,
    through: :mentorships,
    conditions: "status = 'accepted'"

  has_many :requested_friends,
    through: :mentorships,
    source: :friend,
    conditions: "status = 'requested'"

  has_many :pending_friends,
    through: :mentorships,
    source: :friend,
    conditions: "status = 'pending'"



  def self.giving_mentorship
    where('giving_mentorship IS true')
  end

  def self.seeking_mentorship
    where('seeking_mentorship IS true')
  end


end
