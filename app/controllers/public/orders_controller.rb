class Public::OrdersController < ApplicationController
  def new
    @neworder = Order.new
  end

  #def confirm
  #end

  #def completed
  #end

  #def create
  #end

  #def index
  #end

  #def show
  #end

  private

  def order_params
    params.require(:order).permit(:is_deleted,:email,:family_name, :first_name,:family_name_kana, :first_name_kana, :post_code, :address, :phone_number)
  end

end
