class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.all.page(params[:page])
  end

  def show
  end

  def edit
  end
end
