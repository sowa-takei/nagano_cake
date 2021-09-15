class Public::OrdersController < ApplicationController
  #include ShippingCostHelper # mix-in

  def new
    @order = Order.new
  end

  def verification
    @order = Order.new
    @order.payment_method = params[:order][:payment_method].to_i
    @cart_items = current_customer.cart_items
    if params[:order][:address_type] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif  params[:order][:address_type] == "1"
      # @order.postal_code =
      # @order.address =
      # @order.name =
    elsif  params[:order][:address_type] == "2"
      @order.postal_code =params[:order][:full_name]
      @order.address = params[:order][:address]
      @order.name =  params[:order][:name]
    end
  end

  def completion
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    order.save
    redirect_to orders_verification_path

  end

  def index
  end

  def show
  end

  def order_params
    params.require(:order).permit(:payment_method )
  end

end
