class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.customer_id = current_customer.id

  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @totalprice = 0

    # 自身の住所が選択された場合
    if params[:order][:select_address] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.family_name + current_customer.first_name
    # 配送先の住所が選択された場合
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name
    # 新しい住所が選択された場合
    elsif params[:order][:select_address] == "2"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]

    else
      render 'new'
    end
  end

  def completed
  end

  def create
    # 注文データを保存
    @order = Order.new(order_params)
    @order.save

    # カート内商品の情報を一つずつ注文商品に格納してテーブル作成
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.quantity = cart_item.quantity
      @order_detail.transaction_price = cart_item.item.with_tax_price

      @order_detail.save
    end
    # カート内商品を全削除
    current_customer.cart_items.destroy_all

    redirect_to orders_completed_path
  end

  def index
    @order_details = OrderDetail.all
    @orders = Order.all
  end

  def show

  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :post_code, :address, :name, :order_status, :payment_method, :billing_amount, :postage)
  end

end
