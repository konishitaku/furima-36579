class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_post,only: [:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
   @item = Item.find(params[:id])
   if @item.update(item_params)
    redirect_to item_path
    else
     render :edit
   end
  end

  #def destroy
    #@item = Item.find(params[:id])
    #@item.destroy
    #redirect_to root_path
  #end

  def correct_post
   @item = Item.find(params[:id])
   unless @item.user.id == current_user.id
    redirect_to root_path
   end
  end


  private

  def item_params
    params.require(:item).permit(:merchandise, :text, :price, :category_id, :status_id, :area_id, :load_id, :day_id, :image).merge(user_id: current_user.id)
  end
end
