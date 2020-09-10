require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("spec/fixtures/item-sample.png")
  end

  describe '商品出品機能'do
    context '商品出品がうまく行くとき'do
      it 'nameとintroductionとpriceとcondition_idとshipping_date_idとcategory_idとprefecture_idとshipping_locationとuser_idがあれば出品できる' do
        expect(@item).to be_valid
      end
      it 'nameが40文字以下であれば出品できる'do
        @item.name = '空'
        expect(@item).to be_valid
      end
      it 'introductionが1000文字以下で出品できる'do
      @item.introduction = 'ふええええええええええええええええええええええ'
      expect(@item).to be_valid
      end
  end
end


    context '商品出品がうまく行かないとき'do
      it 'nameがないと出品できない'do
        @item.name = ''
        @item.valid? 
        expect(@item.errors.full_messages).to include("Name can't be blank") 
      end
      it 'nameが40文字以上だと出品できない'do
        @item.name = 'ふええええええええええええええええええええええええええええええええええええええええええええええええええええええええ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)") 
      end
      it 'introductionが空だと出品できない'do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank") 
      end
      it 'introductionが1001文字以上だと出品できない'do
        @item.introduction = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction is too long (maximum is 1000 characters)") 
      end
        it 'condition_idが空だと出品できない'do
        @item.condition_id = ''
        @item.valid? 
        expect(@item.errors.full_messages).to include("Condition can't be blank") 
      end
      it 'category_idが空だと出品できない'do
        @item.category_id = ''
        @item.valid? 
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'shipping_location_idが空だと出品できない'do
        @item.shipping_location_id = ''
        @item.valid? 
        expect(@item.errors.full_messages).to include("Shipping location can't be blank") 
      end
      it 'prefecture_idが空だと出品できない'do
        @item.prefecture_id = ''
        @item.valid? 
        expect(@item.errors.full_messages).to include("Prefecture can't be blank") 
      end
      it 'shipping_date_idが空だと出品できない'do
        @item.shipping_date_id = ''
        @item.valid? 
        expect(@item.errors.full_messages).to include("Shipping date can't be blank") 
      end
      it 'priceが空だと出品できない'do
        @item.price = ''
      
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price is not a number") 
      end
      it 'priceが299円以下だと出品できない'do
        @item.price = '299'
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300") 
      end
      it 'priceが9999999円以上だと出品できない'do
        @item.price = '10000000'
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999") 
      end
  end
end