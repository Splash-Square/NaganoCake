# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]


protected
# 退会しているかを判断するメソッド
def customer_state
  ## 【処理内容1】 入力されたemailからアカウントを1件取得
  @customer = Customer.find_by(email: params[:customer][:email])
  ## アカウントを取得できなかった場合、このメソッドを終了する
  return if !@customer
  ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  if @customer.valid_password?(params[:customer][:password])
    ## 【処理内容3】
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true )
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to root_path
    end
  end
end

private

  def after_sign_in_path_for(resource)
    customers_show_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end


def customer_params
    params.require(:customer).permit(:is_deleted,:email,:family_name, :first_name,:family_name_kana, :first_name_kana, :post_code, :address, :phone_number)
end


  # GET /resource/sign_in
  #def new
  #   super
  #end

  # POST /resource/sign_in
  #def create
  #   super
  #end

  # DELETE /resource/sign_out
  #def destroy

  #end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
