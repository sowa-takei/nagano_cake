class Public::CustomersController < ApplicationController
  def show
    #@customer = Customer.find(params[:id])
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_path(@customer)
  end

  def withdrawal
    @customer = current_customer
    @
  end

  #def process
  #end

  #private
  #def customer.params
    #params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  #end

end
