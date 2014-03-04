class MentorshipsController < ApplicationController

  def index
    @user = current_user
    @mentorships = Mentorship.where("user_id = ?", current_user).includes(:friend)
  end

  def destroy
    setup_mentorships
    Mentorship.end_mentorship(@user, @friend)
    flash[:notice] = "Friendship with #{@friend.first_name} deleted!"
    redirect_to mentorships_path
  end

  def create
    setup_mentorships
    Mentorship.request(@user, @friend, params[:giving_mentorship])
    flash[:notice] = "Request has been sent."
    redirect_to users_path
  end

  private
  def setup_mentorships
    @user = current_user
    @friend = User.find(params[:id])
    @giving_mentorship = params[:giving_mentorship]
  end

  def mentorship_params
    params.require(:mentorship).permit(:user, :friend, :giving_mentorship,
    :status)
  end
end
