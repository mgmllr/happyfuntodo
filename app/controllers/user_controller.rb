class UserController < ApplicationController
  
  def subscribe_to_email
  	@user = User.find(params[:id])
  	@user.email_subscription = true
  end

  def unsubscribe_to_email
  	@user = User.find(params[:id])
  	@user.email_subscription = false
  end
end
