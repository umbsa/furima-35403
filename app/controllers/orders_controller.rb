class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :authenticate_user!, only: :index
  before_action :move_to_root, only: :index

  def index
    @order_input = OrderInput.new
  end

  def create
    @order_input = OrderInput.new(order_params)
    if @order_input.valid?
      pay_item
      @order_input.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_input).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.order != nil
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
