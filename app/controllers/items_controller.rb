class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]

  def new
    #空の変数itemを定義
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
  # @tweet.user.nickname
  # @item.category_id => 3

  private

  def item_params
    params.require(:item).permit(:item_name, :detail, :price, :condition_id, :category_id, :delivery_charge_id, :delivery_time_id, :sending_address_id, :image).merge(user_id: current_user.id)
  end
end
