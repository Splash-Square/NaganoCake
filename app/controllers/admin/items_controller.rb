class Admin::ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end
  
  def create
    item = Item.new
    
    if item.save
      redirect_to admin_item_path(item.id)
    else
      redirect_back fallback_location: root_path
    end
  end
  
  def update
  end
end
