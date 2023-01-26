class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
  end

  def show

  end

  def edit
    @item = Itmem.find(params[:id])
  end

  def update
  end
end
