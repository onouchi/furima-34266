require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    @purchaes_shipping_address = FactoryBot.build(:purchase_shipping_address)
    
  end
  describe '商品購入' do
    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@purchaes_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do

      it 'トークンが発行できていないときは決済できないこと' do
        @purchaes_shipping_address.token = nil
        @purchaes_shipping_address.valid?
        expect(@purchaes_shipping_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では決済できないこと' do
        @purchaes_shipping_address.postal_code = ''
        @purchaes_shipping_address.valid?
        expect(@purchaes_shipping_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end

      it '郵便番号に-がないと決済できないこと' do
        @purchaes_shipping_address.postal_code = '1234567'
        @purchaes_shipping_address.valid?
        expect(@purchaes_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      
      it 'prefectureがないと決済できないこと' do
        @purchaes_shipping_address.prefecture_id = 1
        @purchaes_shipping_address.valid?
        expect(@purchaes_shipping_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      
      it '市区町村がないと決済できないこと' do
        @purchaes_shipping_address.city = ''
        @purchaes_shipping_address.valid?
        expect(@purchaes_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      
      it '番地がないと決済できないこと' do
        @purchaes_shipping_address.house_number = ''
        @purchaes_shipping_address.valid?
        expect(@purchaes_shipping_address.errors.full_messages).to include("House number can't be blank")
      end
      
      it '電話番号がないと決済できないこと' do
        @purchaes_shipping_address.phone_number = ''
        @purchaes_shipping_address.valid?
        expect(@purchaes_shipping_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      
      it '電話番号が12桁以上だと決済できないこと' do
        @purchaes_shipping_address.phone_number = '123456789123'
        @purchaes_shipping_address.valid?
        expect(@purchaes_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end

