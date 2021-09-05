class Public::HomesController < ApplicationController
  def top
    @products = Product.all
    @genres = Genre.all
  end

  def about
  end

  def home_params
    params.require(:home).permit(:name, :image, :introduction, :price, :genre_id, :image, :is_active)
  end

end

