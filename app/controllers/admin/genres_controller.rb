class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save

  end

  def edit
     @genre = Genre.find(params[:id])
  end

  def update
     @genre = Genre.find(params[:id])
     @genre.update(genre_params)
     redirect_to admin_genre_path
  end

private
  def genre_params
    params.require(:genre).permit(:item_genre)
  end
end