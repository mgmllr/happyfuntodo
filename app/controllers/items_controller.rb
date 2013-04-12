class ItemsController < ApplicationController
  
  before_filter :authenticate_user!, :find_list

  def find_list
    if params[:list_id]
      @list = List.find(params[:list_id])
    else
      @list = List.find(params[:id])
    end
  end

  #def find_user
  #  @user = User.find(@list.user_id)
  #end

  # Create a new To Do list item
  def create
    @item = Item.new(params[:item])
    @item.list_id = params[:id]
    @item.save

    #respond_to do |format|
    #  if @item.save
    #    format.html { redirect_to list_path(@list), notice: 'Item was successfully created.' }
    #    format.json { render json: @item, status: :created, location: @item }
    #  else
    #    format.html { redirect_to list_path(@list), notice: 'Could not add item at the time. Please try again.'}
    #    format.json { render json: @item.errors, status: :unprocessable_entity }
    #  end
    #  format.js
    #end
    #

    respond_to do |format|
      if @item.save
        format.js
      else
        format.html { redirect_to list_path(@list), notice: 'Could not add item at the time. Please try again.'}
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

  def edit
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @item }
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:item])
      flash[:notice] = "Item was successfully updated"
      redirect_to list_path(@list)
    else

    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.js
    end
  end

end
