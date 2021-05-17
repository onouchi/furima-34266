require "date"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        
  
  validates :nickname , presence: true
  validates :last_name , presence: true , format:{with:/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :first_name , presence: true , format:{with:/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :last_name_katakana , presence: true , format:{with:/\A[ァ-ヶー－]+\z/}
  validates :first_name_katakana, presence: true , format:{with:/\A[ァ-ヶー－]+\z/}
  validates :birth , presence: true


  # has_many :items
  # has_may  :purchases
  # has_many :comments

  
  validates :nickname, presence: true
end
