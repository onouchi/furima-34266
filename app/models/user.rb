require "date"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        
        with_options presence: true do
          validates :nickname 
          validates :last_name , format:{with:/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
          validates :first_name , format:{with:/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
          validates :last_name_katakana , format:{with:/\A[ァ-ヶー－]+\z/}
          validates :first_name_katakana , format:{with:/\A[ァ-ヶー－]+\z/}
          validates :password,  format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

          validates :birth 
        end

        


  has_many :items
  # has_may  :purchases
  # has_many :comments

end
