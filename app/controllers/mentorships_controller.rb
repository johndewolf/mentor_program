class MentorshipsController < ApplicationController

  before_filter :setup_mentorships
  def index
    Mentorship.request(@user, @friend)
    flash[:notice] = "Request has been sent."
    redirect_to users_path
  end

  def show
    @user = current_user
  end

  private
  def setup_mentorships
    @user = current_user
    @friend = User.find_by_email(params[:id])
  end

  def mentorship_params
    params.require(:checkpoint).permit(:user, :friend,
    :status)
  end
end
