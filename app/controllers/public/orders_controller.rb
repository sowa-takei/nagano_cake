class Public::OrdersController < ApplicationController
  #include ShippingCostHelper # mix-in

  def new
    @order = Order.new
    @addresses = Addresse.all
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
       @order.postal_code = @addresse.find_by(address_id: params[:postal_code])
       @order.address = params[:address_id][:address]
       @order.name = params[:address_id][:name]
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
    @order.save
    current_customer.cart_items.each do |cart_item|
    @order_item = OrderDetail.new
    @order_item.order_id = @order.id
    @order_item.amount = cart_item.amount
    @order_item.tax_price = (cart_item.product.price * 1.1).floor
    @order_item.product_id = cart_item.product_id
    @order_item.save
    end
    # ↑order_detailに保存する
    current_customer.cart_items.destroy_all
    # ↑orderとorder_detailに保存したので、カート内商品は削除。

    redirect_to orders_completion_path
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :payment_method, :address, :name, :shipping_cost, :total_payment, :status )
  end

end
