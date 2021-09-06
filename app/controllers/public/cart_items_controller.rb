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
