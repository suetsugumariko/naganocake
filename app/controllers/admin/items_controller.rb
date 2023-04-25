class Admin::ItemsController < ApplicationController
   before_action :authenticate_admin!
  def index
    @items = Item.all
    # @item = Item.new
  end

  def new
    @items = Item.new
    @item_image = Item.new
    #ジャンル　セレクトボックス
    @genre_id = Genre.pluck(:name, :id)
  end

  def create
    item = Item.new(item_params)
    item.save!
    redirect_to admin_item_path(item.id)
  end

  def show
    @item = Item.find(params[:id])

  end

  def edit
    @item = Item.find(params[:id])
    #ジャンル　セレクトボックス
    @genre_id = Genre.pluck(:name, :id)
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :is_active, :item_id, :amount, :genre_id, :title, :body)
  end



end

