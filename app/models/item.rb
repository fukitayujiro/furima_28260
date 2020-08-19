class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :sending_charge
  belongs_to_active_hash :sending_region
  belongs_to_active_hash :sending_day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :sending_charge_id
    validates :sending_region_id
    validates :sending_day_id
  end

  with_options presence: true, numericality: { greater_than: 300, less_than: 10000000 } do
    validates :price
  end

end
