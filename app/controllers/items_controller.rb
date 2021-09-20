class ItemsController < ApplicationController

  def index
  end

  def new
  @items = Items.new
  end

  def create
  Items.create(items_params)
  end

  private
  def items_params
   params.require(:items).permit(:name, :image, :text)
  end
end
