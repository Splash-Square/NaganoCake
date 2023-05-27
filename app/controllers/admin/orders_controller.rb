class Admin::OrdersController < ApplicationController
  def order_customer
     @orders = Order.where(customer_id: params[:id]).page(params[:page]).order(created_at: :desc)
     @order = Order.find_by(customer_id: params[:id])
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end
end
