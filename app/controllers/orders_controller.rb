class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :correct_post,only: [:index,:create]

  def index
    @order_residence = OrderResidence.new
  end

  def create
    @order_residence = OrderResidence.new(order_params)
    if @order_residence.valid?
      pay_item
       @order_residence.save
       redirect_to root_path
       else
       render :index
    end
  end

  private

  def order_params
    params.require(:order_residence).permit(:postal_code, :area_id, :town, :address, :building, :telephone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def correct_post
    if @item.user_id == current_user.id || @item.order != nil
  redirect_to root_path
end
end
    def set_item
      @item = Item.find(params[:item_id])
    end
end

