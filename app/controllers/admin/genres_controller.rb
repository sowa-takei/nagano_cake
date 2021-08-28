class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

   def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
     redirect_to admin_genres_path(@genre), notice:"You have updated book successfully."
    else
     render :show
    end
  end


  private

  def genre_params
    params.permit(:name)
  end
end
