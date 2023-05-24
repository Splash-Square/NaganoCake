class Admin::GenresController < ApplicationController

  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new
    @genre.save

  end

  def edit
     @genre = Genre.find(params[:id])
  end

  def update
     @genre = Genre.find(params[:id])
     @genre.update(genre_params)
     redirect_to admin_genres_path(@genre.id)
  end

private
  def genre_params
    params.require(:genre).permit(:item_genre)
  end
end