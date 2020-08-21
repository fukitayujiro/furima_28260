class TransactionsController < ApplicationController
  before_action :move_to_index, only: :index
  before_action :move_to_login, only: :index

  def index
    @item = Item.find(params[:item_id])
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
  
end