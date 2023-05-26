class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(crafting_status: params[:order_detail][:crafting_status])
    redirect_back fallback_location: root_path
  end
end
