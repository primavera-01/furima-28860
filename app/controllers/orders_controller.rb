class OrdersController < ApplicationController
   before_action :authenticate_user!
   before_action :set_item, only: [:index, :create]
   before_action :move_to_index
  def index 
    @order = OrdersDestination.new
  end

  def create
    @order = OrdersDestination.new(order_params)
    if @order.valid? && @order.save
      pay_item
      return redirect_to root_path
    else
      render 'index'
    end
    
  end

  private

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || !@item.order.nil?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:orders_destination)
          .permit( :prefecture_id, :post_code, :city, :house_number, :building_name, :telephone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency:'jpy'                 
    )
  end
end

