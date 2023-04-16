class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def comfirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    #@address = Address.find(params[:order][:address_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name+current_customer.first_name
    @order.shipping_cost = 800
    @total_price = 0
    #binding.pry
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @order = Order.all
  end

  def show
   @order = Order.find(params[:id])
  end




  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :status)
  end


end
