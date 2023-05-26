class Public::ItemsController < ApplicationController
  def index
    if params[:genre_id] != nil
      @items=Item.where(genre_id: params[:genre_id]).page(params[:page])
    else
      @items = Item.page(params[:page])
    end

    #@items = Item.looks(params[:genre_id])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end
