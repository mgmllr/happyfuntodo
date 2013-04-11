class ItemsController < ApplicationController
  
  before_filter :authenticate_user!, :find_list, :find_user

  def find_list
    @list = List.find(params[:list_id])
  end

  def find_user
    @user = User.find(@list.user_id)
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # Create a new To Do list item
  def create
    @item = @list.items.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to list_path(@list), notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { redirect_to list_path(@list), notice: 'Could not add item at the time. Please try again.'}
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # Set attribute complete to true
  def complete
    @item = @list.items.find(params[:id])
    @item.completed = true
    @item.completed_at = Time.now
    @item.save
    # redirect_to list_path(@list)
    respond_to do |format|
      format.js
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

end
