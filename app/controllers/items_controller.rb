class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  before_action :item , only: [:show, :edit, :update]


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

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :detail, :price, :condition_id, :category_id, :delivery_charge_id, :delivery_time_id, :sending_address_id, :image).merge(user_id: current_user.id)
  end

  def item
    @item = Item.find(params[:id])
  end
end
