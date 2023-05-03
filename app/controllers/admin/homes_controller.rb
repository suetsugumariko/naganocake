class Admin::HomesController < ApplicationController
   before_action :authenticate_admin!


  def top
    @orders = Order.all
  end









   private

  def homes_params
    params.require(:homes).permit(:created_at, :name, :amount, :status)
  end




end
