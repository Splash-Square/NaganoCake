class Admin::OrdersController < ApplicationController
  def show
     @orders = Order.where(customer_id: params[:id]).page(params[:page])
     @order = Order.find_by(customer_id:params[:id])
  end
end
