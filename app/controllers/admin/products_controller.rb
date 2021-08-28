class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genres = Genre.all
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
     @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
     redirect_to edit_admin_product_path(@product), notice:"You have updated book successfully."
    else
      #updateを失敗すると編集ページへ
      render 'show'
    end
  end

   # 投稿データのストロングパラメータ
  private

  def product_params
    params.require(:product).permit(:name, :image, :introduction, :price, :genre_id, :image)
  end

end
