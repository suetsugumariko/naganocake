class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def comfirm
    @order = Order.new(order_params)
    #@address = Address.find(params[:order][:address_id])
    #@order.postal_code = @address.postal_code
    #@order.address = @address.address
    #@order.name = @address.name
    #binding.pry
  end

  def complete
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to '  /orders/confirm'
  end

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end


  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end


end
