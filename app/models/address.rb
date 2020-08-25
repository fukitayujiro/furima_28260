class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_item
  belongs_to_active_hash :prefecture
  
end
