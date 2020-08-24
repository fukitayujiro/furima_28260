class TransactionsController < ApplicationController
  before_action :move_to_index, only: :index
  before_action :move_to_login, only: :index

  def index
    @item = Item.find(params[:item_id])
    @address = Address.new
  end

  def create
    @item = Item.find(params[:item_id])
    @address = UserAddress.new(address_params)
    if @address.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def address_params
    params.permit(:token, :postal_code, :prefectures_id, :city, :addresses, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], user_item_id: params[:user_item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_0bbce8766a6a572bd3438742"
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency:'jpy'
    )
  end

end