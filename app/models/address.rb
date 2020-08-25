class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_item
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :prefectures_id
    validates :city
    validates :addresses
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :prefectures_id
  end
  
  VALID_POSTAL_REGEX = /\A\d{3}[-]\d{4}\z/
  with_options presence: true, format: { with: VALID_POSTAL_REGEX, message: 'ハイフン含む7桁の数字で入力してください' } do
    validates :postal_code
  end
  
  VALID_PHONE_REGEX = /\A\d{11}\z/
  with_options presence: true, format: { with: VALID_PHONE_REGEX, message: '使用できるのは11桁未満の数字のみです' } do
    validates :phone_number
  end

  # with_options presence: true, length: { maximum: 11, message:'11桁以内の数字のみ入力してください' } do
  #   validates :phone_number
  # end
  
end
