require 'rails_helper'

RSpec.describe OrderInput, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_input = FactoryBot.build(:order_input, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end


  describe '商品購入' do
    context '商品購入できるとき' do
      it '必須情報が入力されていれば購入できる' do
        expect(@order_input).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @order_input.building = ''
        expect(@order_input).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'postal_codeが空のとき' do
        @order_input.postal_code = ''
        @order_input.valid?
        expect(@order_input.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないとき' do
        @order_input.postal_code = '12345678'
        @order_input.valid?
        expect(@order_input.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが1のとき' do
        @order_input.prefecture_id = 1
        @order_input.valid?
        expect(@order_input.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空のとき' do
        @order_input.city = ''
        @order_input.valid?
        expect(@order_input.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空のとき' do
        @order_input.addresses = ''
        @order_input.valid?
        expect(@order_input.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空のとき' do
        @order_input.phone_number = ''
        @order_input.valid?
        expect(@order_input.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは11桁より多いとき' do
        @order_input.phone_number = '090123456789'
        @order_input.valid?
        expect(@order_input.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberが全角数字のとき' do
        @order_input.phone_number = '０９０１２３４５６７８'
        @order_input.valid?
        expect(@order_input.errors.full_messages).to include("Phone number は半角数字のみ使えます")
      end
      it 'phone_numberが英数混合のとき' do
        @order_input.phone_number = 'abo01234567'
        @order_input.valid?
        expect(@order_input.errors.full_messages).to include("Phone number は半角数字のみ使えます")
      end
      it 'phone_numberが正しく入力されていないとき' do
        @order_input.phone_number = 'abcdefghijk'
        @order_input.valid?
        expect(@order_input.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'user_idが空のとき' do
        @order_input.user_id = ''
        @order_input.valid?
        expect(@order_input.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空のとき' do
        @order_input.item_id = ''
        @order_input.valid?
        expect(@order_input.errors.full_messages).to include("Item can't be blank")
      end
      it 'クレジットカード情報が空のとき' do
        @order_input.token = ''
        @order_input.valid?
        expect(@order_input.errors.full_messages).to include("Token クレジットカード情報を正しく入力してください")
      end
    end
  end
end
