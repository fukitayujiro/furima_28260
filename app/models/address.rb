class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_item
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :prefectures_id
    validates :city
    validates :addresses
  end
  
  VALID_POSTAL_REGEX = /[\d]{3}-[\d]{4}/
  with_options presence: true, format: { with: VALID_POSTAL_REGEX, message: 'ハイフン含む7桁の数字で入力してください' } do
    validates :postal_code
  end
  
  VALID_PHONE_REGEX = /\d/
  with_options presence: true, length: { maximum: 11 }, format: { with: VALID_PHONE_REGEX, message: '11桁以内の数字で入力してください' } do
    validates :phone_number
  end
  
end
