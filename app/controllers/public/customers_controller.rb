class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def confirm_withdraw
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "User-introduction was successfully updated."
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end

  def withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:email,:family_name, :first_name, :family_name_kana,:first_name_kana, :post_code, :address, :phone_number)
  end


end
