class ItemsController < ApplicationController

  before_action :authenticate_customer!, except: [:index]

  def index
  	@genres = Genre.all
  	if params[:genre_id]
  		@genre = Genre.find(params[:genre_id])
  		@items = @genre.items.page(params[:page]).per(8)
  	else
  		@items = Item.page(params[:page]).per(8)
  	end
  end


  def show
   	@genres = Genre.all
  	@item = Item.find(params[:id])
  	@cart_item =CartItem.new
  end

end
