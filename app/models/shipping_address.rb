class ShippingAddress < ApplicationRecord
  # include ActiveModel::Model
  # attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :token, :user_id
  belongs_to :purchase
  # with_options presence: true do
  #   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #   validates :city
  #   validates :house_number
  #   validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/}
  # end
  # validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  # validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  
  # def save
  #   Purchase.create(user_id: user_id, item_id: item_id)
  #   AddressAdress.create(postal_code: postal_code,  prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  # end
end
