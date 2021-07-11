class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_charged
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :estimated_shipping_date
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :image
    validates :title,                       length: { maximum: 40 }
    validates :text,                        length: { maximum: 1000 }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :product_condition_id
      validates :delivery_charged_id
      validates :prefecture_id
      validates :estimated_shipping_date_id
    end

    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
  end
  
end
