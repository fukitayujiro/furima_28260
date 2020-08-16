class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
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

end