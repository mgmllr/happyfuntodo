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
      
    respond_to do |format|
      if @items
        format.html # show.html.erb
        format.json { render json: @list }
      else
        format.html { redirect_to new_user_session_path }
      end
    end
  end

  def invite_user ### THIS NEEDS TO BE FIXED
    ###Must validate that it's a valid email. 
    @list = List.find(params[:id])
    inviter = User.find(@list.user_id)
    email = User.find_by_email(params[:invitee])
    FollowInviteMailer.invite(inviter, email)

    respond_to do |format|
      if @email
        format.html { redirect_to list_path(@list), notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { redirect_to list_path(@list), notice: 'Could not add item at the time. Please try again.'}
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
end
