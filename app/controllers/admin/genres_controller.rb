class Admin::GenresController < ApplicationController
  def index
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
  end

  def edit
  end

  def update
  end

end
