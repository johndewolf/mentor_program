class UsersController < ApplicationController

  def index
    @giving_mentorship = User.giving_mentorship.where('id != ?', current_user.id)
    @seeking_mentorship = User.seeking_mentorship.where('id != ?', current_user.id)
  end
end
