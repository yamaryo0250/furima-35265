class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect

  def index
    redirect_to root_path if @item.order.present?

    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :area_id, :municipality, :house_num, :building, :tel).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def redirect
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user.id != @item.user_id
  end
end
