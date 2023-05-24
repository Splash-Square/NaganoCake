class Public::OrdersController < ApplicationController
  def new
    @neworder = Order.new
    @neworder.customer_id = current_customer.id

  end

  #def confirm
  #end

  #def completed
  #end

  #def create
  #end

  def index
    @order = Order.new
    @orders = Order.all
  end

  def show
    @order = Order.new
    @orders = Order.all
  end

  private

  def order_params
    params.require(:order).permit(:post_code,:address,:name, :payment_method,:billing_amount, :postage)
  end

end
