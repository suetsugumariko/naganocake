class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end


  private
  def customer_params
    params.require(:customer).permit(:name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end


end
