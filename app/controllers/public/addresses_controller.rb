class Public::AddressesController < ApplicationController

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
  end

  def update
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:post_code, :address, :name )
  end
end