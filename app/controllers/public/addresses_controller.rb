class Public::AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses
    @addresse = Addresse.new
  end

  def edit
    @addresse = Addresse.find(params[:id])
    #@addresse = current_customer.addresses
    #find(params[:id])
  end

  def create
    @addresse = Addresse.new(addresse_params)
    @addresse.customer_id = current_customer.id
    @addresse.save

    redirect_to addresses_path(@addresse)
  end

  def update
    @addresse = Addresse.find(params[:id])
    @addresse.update(addresse_params)
    redirect_to addresses_path(@addresse)
  end

  def destroy
    @addresse = Addresse.find(params[:id])
    @addresse.destroy
    redirect_to addresses_path
  end

  private
  def addresse_params
    params.require(:addresse).permit(:customer_id, :name, :postal_code, :address)
  end

end
