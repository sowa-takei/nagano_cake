class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items

  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path(@cart_item), notice:"You have updated book successfully."
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
   if current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id]).present?
    cart_item = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id])
    cart_item.amount += params[:cart_item][:amount].to_i
    cart_item.save
    flash[:notice] = "Item was successfully added to cart."
    redirect_to cart_items_path


   elsif @cart_item.save
   flash[:notice] = "New Item was successfully added to cart."
    redirect_to cart_items_path

   else
    render 'customers/items/show'

   end

  end

  def delete
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
　 end

  def destroy
     @cart_items = current_customer.cart_items
     @cart_items.destroy_all
     redirect_to cart_items_path
  end




  def cart_item_params
    params.require(:cart_item).permit(:product_id, :customer_id, :amount)
  end


end
