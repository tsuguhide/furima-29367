class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item

  def index
    @order = OrderAddress.new
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif !@item.order.nil?
      redirect_to root_path
    end
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:zip_code, :sending_address_id, :municipality, :street_address, :building, :telephone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]# PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end
end
