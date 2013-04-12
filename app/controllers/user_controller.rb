class UserController < ApplicationController
  
  def subscribe_to_email
  	@user = User.find(params[:id])
  	@user.email_subscription = true
  end

  def unsubscribe_to_email
  	@user = User.find(params[:id])
  	@user.email_subscription = false
  end

  def create_follower
    @user = current_user
    @follower = User.find_by_email(params[:follower])
    @follower.follow!(@user)
    redirect_to list_path(current_user.list)
  end

  def unfollow_user
    @follower = User.find(params[:follower])
    @user = User.find(params[:id])
    @follower.unfollow!(@user)
  end
end
