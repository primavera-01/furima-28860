class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :image, :text, :category_id, :condition_id, :prefecture_id, :shipping_date_id, :shipping_location_id).merge(user_id: current_user.id)
  end

end