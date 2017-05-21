class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order("id DESC")
  end

  def show
    @order = current_user.orders.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end
  
  def cancel
    @order = Order.find_by_token(params[:id])
    if current_user == @order.user
      @order.cancel_order!
      flash[:success] = '订单取消成功！'
    else
      flash[:warning] = '你只能取消自己的订单！'
    end
    redirect_to :back
  end
end
