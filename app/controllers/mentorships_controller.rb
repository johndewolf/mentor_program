class MentorshipsController < ApplicationController

  before_filter :setup_mentorships

  def show
    @user = current_user
  end

  def new
    @mentorship = Mentorship.new(giving_mentorship: params[:giving_mentorship])
  end

  def create
    Mentorship.request(@user, @friend, params[:giving_mentorship])
    flash[:notice] = "Request has been sent."
    redirect_to users_path
  end

  private
  def setup_mentorships
    @user = current_user
    @friend = User.find_by_email(params[:id])
  end

  def mentorship_params
    params.require(:mentorship).permit(:user, :friend, :giving_mentorship,
    :status)
  end
end
