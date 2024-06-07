class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @user = current_user
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @user = @item.user
  unless user_signed_in? && current_user.id == @item.user_id
    redirect_to root_path
  end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to user_item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
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
