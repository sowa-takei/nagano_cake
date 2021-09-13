class Public::OrdersController < ApplicationController
  def new
     @order = Order.new
  end

  def verification
    @order = Order.new
    @order.payment_method = params[:order][:payment_method].to_i
  end

  def completion
  end

  def create
  end

  def index
  end

  def show
  end

  def order_params
    params.require(:order).permit(:payment_method )
  end

end
