class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @item = Item.new
    @items = Item.all.includes(:user)
    @items = Item.order("created_at DESC")
  end

  def new
    @user = current_user
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @items = @user.items.includes(:user)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :category_id, :item_condition_id, :prefecture_id, :shipping_period_id, :postage_payer_id, :item_price, :image).merge(user_id: current_user.id)
  end
end
