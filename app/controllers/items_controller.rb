class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :find_item_id, only: [:edit, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to new_user_session_path
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path(item.id)
    else
      render :show
    end
  end

  def show
    @items = Item.all
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explain, :price, :image, :category_id, :item_status_id, :sending_charge_id, :sending_region_id, :sending_day_id,).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def find_item_id
    @item = Item.find(params[:id])
  end

end