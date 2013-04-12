class ListsController < ApplicationController
  
  before_filter :authenticate_user!

  # Show List of To Do Items | Main Interface
  def show
    if session[:user]
      @user = User.find(session[:user])
      @list = List.find(session[:id])
      @items = @list.items.all
    elsif params[:id]
      @list = List.find(params[:id])
      @items = @list.items.all
      @user = User.find(@list.user_id)
    end
    @item = Item.new
      
    respond_to do |format|
      if @items
        format.html # show.html.erb
        format.json { render json: @list }
      else
        format.html { redirect_to new_user_session_path }
      end
    end
  end

  # def invite_user ### THIS NEEDS TO BE FIXED
  #   inviter = current_user
  #   ## Look up whether invitee already exists.
  #   invitee = User.find_by_email(params[:invitee])
  #   FollowInviteMailer.invite(inviter, invitee)

  #   respond_to do |format|
  #     if invitee
  #       format.html { redirect_to list_path(inviter.list), notice: 'Email was successfully sent.' }
  #       format.json { render json: @item, status: :created, location: @item }
  #     else
  #       format.html { redirect_to list_path(inviter.list), notice: 'I\'m sorry, that user does not have an account.'}
  #       format.json { render json: @item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
end
