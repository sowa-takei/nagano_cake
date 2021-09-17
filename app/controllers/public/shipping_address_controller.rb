class Public::ShippingAddressController < ApplicationController
  def index
    @shipping_address = ShippingAddres.all
    #@shipping_address = current_customer
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
