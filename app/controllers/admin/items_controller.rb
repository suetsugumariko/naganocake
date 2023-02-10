class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
  end

  def new
    @items = Item.new
    @item_image = Item.new
    #ジャンル　セレクトボックス
    @genre_id = Genre.pluck(:name, :id)
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item.id)
  end

  def show
    @item = Item.find(params[:id])
    @item = Item.new
  end

  def edit
    @item = Itmem.find(params[:id])
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :is_active, :item_id, :amount)
  end



end

