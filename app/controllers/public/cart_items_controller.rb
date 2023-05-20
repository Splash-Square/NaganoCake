class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
  end

  def update
  end

  def destroy
  end

  def all_destroy
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    
    if @cart_item.save
      @cart_items = current_customer.cart_items.all
      render 'index'
    else
      redirect_back fallback_location: root_path
    end
  end


private
    def cart_item_params
        params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
    end
end
