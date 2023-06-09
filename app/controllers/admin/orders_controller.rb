class Admin::OrdersController < ApplicationController
  def order_customer
     @orders = Order.where(customer_id: params[:id]).page(params[:page]).order(created_at: :desc)
     @order = Order.find_by(customer_id: params[:id])
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    
    if @order.update(order_params)
      @order_details.update_all(crafting_status: 1) if @order.order_status == "payment_confirmed"
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status, :order_detail)
  end
end
