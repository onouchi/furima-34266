class Purchase  < ApplicationRecord
  # include ActiveModel::Model
  # attr_accessor :user, :item
  # attr_accessor :token
  belongs_to :user
  belongs_to :item
  has_one :shipping_address
  
  # with_options presence: true do
  #   # validates :user
  #   validates :item
  #   validates :token
  # end
  # validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is invalid"}

  # def save
  #   user =  User.create(nickname: nickname, email: email, password: password, first_name: first_name, family_name: family_name, first_name_kana: first_name_kana, family_name_kana: family_name_kana, birth_day: birth_day)
  #   Item.create(name: name, introduction: introduction, category_id: category.id, item_condition_id: item_condition.id, postage_id: postage.id, prefecture_id: prefecture.id, prepare_id: prepare.id, price: price, user_id: user.id)
  # end
end

