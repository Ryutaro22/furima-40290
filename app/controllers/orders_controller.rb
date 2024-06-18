class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    else
      @order_address = OrderAddress.new
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if current_user.id != @item.user_id?
      if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
      else
        gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
        render 'index', status: :unprocessable_entity
      end
    else
      redirect_to root_path
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.item_price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
