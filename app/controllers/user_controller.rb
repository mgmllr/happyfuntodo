class UserController < ApplicationController
  
  def subscribe_to_email
  	@user = User.find(params[:id])
  	@user.email_subscription = true
  end

  def unsubscribe_to_email
  	@user = User.find(params[:id])
  	@user.email_subscription = false
    @user.save

    if @user.save
      redirect_to list_path(current_user.list), :flash => {:notice => "You have been successfully unsusbscribed from daily emails."}
    else
      redirect_to list_path(current_user.list), :flash => {:error => "Sorry, we couldn't unsubscribe you at this time. Please try again."}
    end
  end

  def create_follower
    @user = current_user
    @follower = User.find_by_email(params[:follower])
    if @follower
      @follower.follow!(@user)
      redirect_to list_path(current_user.list)
    else
      redirect_to list_path(current_user.list), :flash => {:error => "#{params[:follower]} is not a user. Cannot follow him or her."}
    end
  end

  def unfollow_user
    list = List.find(params[:list_id])
    @followed = User.find(list.user_id)
    @user = current_user
    @user.unfollow!(@followed)
    redirect_to list_path(current_user.list)
  end
end