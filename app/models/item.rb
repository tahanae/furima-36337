  class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image

      validates :image,                presence: true
      validates :title,                presence: true, length: { maximum: 40 }
      validates :explanation,          presence: true, length: { maximum: 1000 }
      validates :category_id,          presence: true, numericality: { other_than: 1 }
      validates :condition_id,         presence: true, numericality: { other_than: 1 }
      validates :DeriveryCharge_id,    presence: true, numericality: { other_than: 1 }
      validates :area_id,              presence: true, numericality: { other_than: 1 }
      validates :ScheduledDelivery_id, presence: true, numericality: { other_than: 1 }
      validates :user,                 presence: true


    # 価格は、¥300 ~ ¥9,999,999の間のみ保存可能
    with_options presence: true, format: {with: /\A[0-9]+\z/ } do
      validates :price, numericality: { only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to:9_999_999 },
                        presence: { message: "can't be blank" }
    end


    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :DeriveryCharge
    belongs_to :area
    belongs_to :ScheduledDelivery

  end
  
