class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def create
    item = Item.new(item_params)

    item.save
    redirect_to admin_item_path(item.id)
    # else
    #   redirect_back fallback_location: root_path
    # end
  end

  def update
  end


  private

  def item_params
    params.require(:item).permit(:genre_id, :item_name, :item_description, :price, :is_selling, :image)
  end

end
