class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end

   # 投稿データのストロングパラメータ
  private

  def product_params
    params.require(:product).permit(:name, :image, :introduction, :price)
  end

end
