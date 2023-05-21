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
    exist_item = current_customer.cart_items.find_by(item_id: params[:item_id])

    if exist_item.present?
      exist_item.quantity += params[:quantity].to_i

      exist_item.save
      redirect_to cart_items_path

    elsif @cart_item.save
      @cart_items = current_customer.cart_items.all
      render 'index'
    else
      redirect_back fallback_location: root_path
    end
  end


private


    def cart_item_params
        params.require(:cart_item).permit(:customer_id, :item_id, :quantity, :price)
    end
end
