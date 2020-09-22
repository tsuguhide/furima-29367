class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end


#  before_action :if current_user == user_id redirect_to root_path
#  sold out の時も


end
