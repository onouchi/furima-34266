class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_charged
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :product_condition 
  belongs_to_active_hash :estimated_shipping_date
  has_one_attached :image

  validates :image,                       presence: true
  validates :title,                       presence: true, length: { maximum: 40 }
  validates :text,                        presence: true, length: { maximum: 1000 }
  validates :category_id,                 presence: true, numericality:{ other_than: 1 }
  validates :product_condition_id,        presence: true, numericality:{ other_than: 1 }
  validates :delivery_charged_id,         presence: true, numericality:{ other_than: 1 }
  validates :prefecture_id,               presence: true, numericality:{ other_than: 1 }
  validates :estimated_shipping_date_id,  presence: true, numericality:{ other_than: 1 }
  validates :price,                       presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  # validates :user_id,                     presence: true

  
end
