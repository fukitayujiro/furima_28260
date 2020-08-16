class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :sending_charge
  belongs_to_active_hash :sending_region
  belongs_to_active_hash :sending_day
  belongs_to :user
  has_one_attached :image

end
