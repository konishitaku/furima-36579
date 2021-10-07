class OrdersController < ApplicationController

  def index
    @order_residence = OrderResidence.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_2ac26fbe58499a23b8eb0aac"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

