class Public::ItemsController < ApplicationController
  def index
    @products = Product.all
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
  end



end
