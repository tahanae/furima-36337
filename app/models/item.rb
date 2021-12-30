  class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image


    # ジャンルの選択が「--」の時は保存できない
    with_options presence: true do
      validates :title
      validates :explanation
      validates :category_id
      validates :condition_id
      validates :DeriveryCharge_id
      validates :area_id
      validates :ScheduledDelivery_id
      validates :user
    end


    validates :category_id,          numericality: { other_than: 1 }
    validates :condition_id,         numericality: { other_than: 1 }
    validates :DeriveryCharge_id,    numericality: { other_than: 1 }
    validates :area_id,              numericality: { other_than: 1 }
    validates :ScheduledDelivery_id, numericality: { other_than: 1 }

    
    # 価格は、¥300 ~ ¥9,999,999の間のみ保存可能
    with_options presence: true, format: {with: /\A[0-9]+\z/ } do
      validates :price, numericality: { only_integer: true, greater_then_or_equal_to:300, less_then_or_eqal_to:9_999_999 },
                        presence: { message: "can't be blank" }
    end


    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :DeriveryCharge
    belongs_to :area
    belongs_to :ScheduledDelivery

  end
  
