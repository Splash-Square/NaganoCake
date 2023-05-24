class Public::OrdersController < ApplicationController
  def new
    @neworder = Order.new
    @neworder.customer_id = current_customer.id

  end

  def confirm
    @neworder = Order.new
    @cart_items = current_customer.cart_items.all
    @totalprice = 0

    if params[:order][:select_address] == "0"
      @neworder.post_code = current_customer.post_code
      @neworder.address = current_customer.address
      @neworder.name = current_customer.family_name + current_customer.first_name

    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @neworder.post_code = @address.post_code
      @neworder.address = @address.address
      @neworder.name = @address.name

    elsif params[:order][:select_address] == "2"
      @neworder.post_code = params[:order][:post_code]
      @neworder.address = params[:order][:address]
      @neworder.name = params[:order][:name]

    else
      render 'new'
    end
  end

  def completed
  end

  def create
    @neworder = Order.new
    @neworder.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all

    @neworder.save
  end

  #def index
  #end

  #def show
  #end

  private

  def order_params
    params.require(:order).permit(:post_code, :address, :name, :payment_method, :billing_amount, :postage)
  end

end
