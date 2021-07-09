class PurchaseShippingAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :price, :user_id, :token, :phone_number, :item_id

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number ,purchase_id: purchase.id)
  end
end