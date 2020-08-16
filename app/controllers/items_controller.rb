class ItemsController < ApplicationController

  def index
  end

  private
  def item_params
    params.require(:item).permit(:name, :explain, :price, :image, :category_id, :item_status_id, :sending_charge_id, :sending_region_id, :sending_day_id,).merge(user_id: current_user.id)
  end
  
end