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

  def self.giving_mentorship
    where('giving_mentorship IS true')
  end

  def self.seeking_mentorship
    where('seeking_mentorship IS true')
  end

end
