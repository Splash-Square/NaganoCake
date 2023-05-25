class Admin::ItemsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)

    if item.save
      redirect_to admin_item_path(item.id)
    else
      redirect_back fallback_location: root_path
    end
  end

  def update
    item = Item.find(params[:id])

    if item.update(item_params)
      redirect_to admin_item_path(item.id)
    else
      redirect_back fallback_location: root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:genre_id, :item_name, :item_description, :price, :is_selling, :image)
  end

end
