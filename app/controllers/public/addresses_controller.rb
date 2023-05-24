class Public::AddressesController < ApplicationController

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def index
    @address = Address.new
    @addresses = current_customer.addresses.all
  end

  def edit
    @address = Address.find(params[:id])
  end

<<<<<<< HEAD
  def create
  end

=======
>>>>>>> d0c0f50a674646d99b629fac2a5edfe1b9965f3a
  def update
  @address = Address.find(params[:id])
  @address.customer_id = current_customer.id
  @address.update(address_params)
  redirect_to addresses_path
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