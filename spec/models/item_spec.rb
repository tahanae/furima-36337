require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    context '商品出品ができる時' do
      it '全ての値が存在するとき ' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない場合' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空では投稿できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
  
      it 'explanationが空では投稿できない'do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
  
      it 'categoryの選択が「 --- 」では投稿できない' do
        @item.category_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'conditionの選択が「 --- 」では投稿できない' do
        @item.condition_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'DeriveryChargeの選択が「 --- 」では投稿できない' do
        @item.DeriveryCharge_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Deriverycharge must be other than 1")
      end

      it 'areaの選択が「 --- 」では投稿できない' do
        @item.area_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end

      it 'ScheduledDeliveryの選択が「 --- 」では投稿できない' do
        @item.ScheduledDelivery_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduleddelivery must be other than 1")
      end

      it 'priceが空は投稿できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角数値でないと投稿できない' do
        @item.price = 'a９９９９' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '価格が300円以下では出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が9_999_999円以上では出品できない' do
        @item.price = 1000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end
  end
end
