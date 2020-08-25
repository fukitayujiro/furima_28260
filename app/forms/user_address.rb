class UserAddress

  include ActiveModel::Model
  attr_accessor :token, :price, :postal_code, :phone_number, :city, :addresses, :building_name, :prefectures_id, :user_item_id, :user_id, :item_id

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

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Address.create(user_item_id: user_item.id, postal_code: postal_code, phone_number: phone_number, city: city, addresses: addresses, building_name: building_name, prefectures_id: prefectures_id)
  end
end