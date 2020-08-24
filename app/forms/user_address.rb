class UserAddress

  include ActiveModel::Model
  attr_accessor :token, :price, :postal_code, :phone_number, :city, :addresses, :building_name, :prefectures_id, :user_item_id, :user_id, :item_id

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Address.create(user_item_id: user_item.id, postal_code: postal_code, phone_number: phone_number, city: city, addresses: addresses, building_name: building_name, prefectures_id: prefectures_id)
  end
end