class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title,              null: false
      t.text       :explanation,        null: false
      t.integer    :category_id,        null: false
      t.integer    :condition_id,       null: false
      t.integer    :DeriveryCharge_id, null: false
      t.integer    :area_id,            null: false
      t.integer    :ScheduledDelivery_id, null: false
      t.integer    :price,              null: false
      t.references :user,               null: false
      t.text       :image

      t.timestamps
    end
  end
end