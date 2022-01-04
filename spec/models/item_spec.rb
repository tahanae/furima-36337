require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    context '商品の出品ができない場合' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空では投稿できない' do
        @item = Item.new(title: '' )
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
  
      it 'explanationが空では投稿できない'do
        @item = Item.new(explanation: '' )
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
  
      it 'categoryの選択が「 --- 」では投稿できない' do
        @item = Item.new(category_id: 1 )
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'conditionの選択が「 --- 」では投稿できない' do
        @item = Item.new(condition_id: 1 )
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'DeriveryChargeの選択が「 --- 」では投稿できない' do
        @item = Item.new(DeriveryCharge_id: 1 )
        @item.valid?
        expect(@item.errors.full_messages).to include("Deriverycharge must be other than 1")
      end

      it 'areaの選択が「 --- 」では投稿できない' do
        @item = Item.new(area_id: 1 )
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end

      it 'ScheduledDeliveryの選択が「 --- 」では投稿できない' do
        @item = Item.new(ScheduledDelivery_id: 1 )
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduleddelivery must be other than 1")
      end

      it 'priceが空は投稿できない' do
        @item = Item.new(price: '' )
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角数値でないと投稿できない' do
        @item = Item.new(price: 'a９９９９' )
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
