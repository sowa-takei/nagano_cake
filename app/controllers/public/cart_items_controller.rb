class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path(@cart_item), notice:"You have updated book successfully."
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
   if current_customer.cart_items.find_by(product_id: params[:cart_item][:item_id]).present?
    cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    cart_item.number += params[:cart_item][:number].to_i
    cart_item.save
    flash[:notice] = "Item was successfully added to cart."
    redirect_to cart_items_path


   elsif @cart_item.save
   flash[:notice] = "New Item was successfully added to cart."
    redirect_to cart_items_path
   else
    render 'end_users/items/show'
   end
     @cart_item.save
     redirect_to cart_items_path




  end

  def destroy
  end

  def delete
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :customer_id, :amount)
  end


end
