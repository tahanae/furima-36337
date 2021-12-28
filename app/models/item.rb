  class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image


    validates :title,              presence: true
    validates :explanation,        presence: true
    validates :condition_id,       presence: true
    validates :DeriveryCharge_id, presence: true
    validates :area_id,            presence: true
    validates :ScheduledDelivery_id, presence: true
    validates :price,              presence: true
    validates :user,               presence: true


    # ジャンルの選択が「--」の時は保存できない
    validates :category_id, numericality: { other_than: 1 }

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :DeriveryCharge
    belongs_to :area
    belongs_to :ScheduledDelivery

  end
  
