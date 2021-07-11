require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @purchaes_shipping_address = FactoryBot.build(:purchase_shipping_address, item_id: item.id, user_id: user.id)
    sleep 1
  end
  describe '商品購入' do
    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@purchaes_shipping_address).to be_valid
      end
      it '建物名は空でも購入できる' do
        @purchaes_shipping_address.building_name = ''
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
      
      it '電話番号が英数字混合だと決済できないこと' do
        @purchaes_shipping_address.phone_number = 'aaaaa567891'
        @purchaes_shipping_address.valid?
        expect(@purchaes_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
      
      it '紐づくユーザーが存在しないと保存できないこと' do
        @purchaes_shipping_address.user_id = ''
        @purchaes_shipping_address.valid?
        expect(@purchaes_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      
      it '紐づくアイテムが存在しないと保存できないこと' do
        @purchaes_shipping_address.item_id = ''
        @purchaes_shipping_address.valid?
        expect(@purchaes_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

