class Public::CustomersController < ApplicationController
  #def show
  #end

  #def edit
  #end

  #def confirm_withdraw
  #end

  def update
    if current_customer.update(customer_params)
      flash[:notice] = "User-introduction was successfully updated."
      redirect_to customers_show_path
    else
      render :edit
    end
  end

  def withdraw
    if current_customer.update(is_deleted: true)
       reset_session
       redirect_to root_path
    else
      render :edit
    end
  end


  private

  def customer_params
    params.require(:customer).permit(:is_deleted,:email,:family_name, :first_name,:family_name_kana, :first_name_kana, :post_code, :address, :phone_number)
  end


end
