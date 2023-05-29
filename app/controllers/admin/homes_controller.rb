class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all.page(params[:page]).order(created_at: :desc)
  end
end