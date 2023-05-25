class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    #@items = Item.looks(params[:genre_id])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end
