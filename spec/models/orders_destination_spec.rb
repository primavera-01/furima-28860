require 'rails_helper'

RSpec.describe OrdersDestination, type: :model do
  before do
    @orders_destination = FactoryBot.build(:orders_destination)
  end

  describe '発送先情報の登録' do
    context '発送先情報登録がうまくいくとき' do
      it '建物名以外が記述されていれば登録できる' do
        expect(@orders_destination).to be_valid
      end
    end

    context '発送先情報がうまくいかないとき' do
      it '郵便番号が空だと登録できない' do
        @orders_destination.post_code = ''
        @orders_destination.valid?
        expect(@orders_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号に(-)無しでは登録できない' do
        @orders_destination.post_code = '1234567'
        @orders_destination.valid?
        expect(@orders_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が空だと登録できない' do
        @orders_destination.prefecture_id = ''
        @orders_destination.valid?
        expect(@orders_destination.errors.full_messages).to include("Prefecture can't be blank", "Prefecture を選択してください")
      end
      it '市町村が空だと登録できない' do
        @orders_destination.city = ''
        @orders_destination.valid?
        expect(@orders_destination.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと登録できない' do
        @orders_destination.house_number = ''
        @orders_destination.valid?
        expect(@orders_destination.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が9桁だと登録できない' do
        @orders_destination.telephone_number = '080123456'
        @orders_destination.valid?
        expect(@orders_destination.errors.full_messages).to include("Telephone number is invalid. Include 10-11")
      end
      it '電話番号が12桁だと登録できない' do
        @orders_destination.telephone_number = '080123456789'
        @orders_destination.valid?
        expect(@orders_destination.errors.full_messages).to include("Telephone number is invalid. Include 10-11")
      end
      it 'ユーザー情報が無いと登録できない' do
        @orders_destination.user_id = ''
        @orders_destination.valid?
        expect(@orders_destination.errors.full_messages).to include("User can't be blank")
      end
      it '商品情報が無いと登録できない' do
        @orders_destination.item_id = ''
        @orders_destination.valid?
        expect(@orders_destination.errors.full_messages).to include("Item can't be blank")
      end
      it 'カード情報が無いと登録できない'do
      @orders_destination.token = ''
      @orders_destination.valid?
      expect(@orders_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
