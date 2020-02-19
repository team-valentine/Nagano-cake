class Admins::ItemsController < ApplicationController
before_action :authenticate_admin!
  def top
    @order = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      flash[:item_success] = "商品が登録されました。"
      redirect_to admins_items_path
    else
      flash[:item_error] = "空欄があります。"
      redirect_to new_admins_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admins_item_path
  end




  private

  def item_params
    params.require(:item).permit(:name, :description, :genre_id, :tax_excluded_price, :status, :image)
  end

end
