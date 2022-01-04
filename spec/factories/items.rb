FactoryBot.define do
  factory :item do
    title {"タイトル"}
    image {Faker::Lorem.sentence}
    explanation {'説明'}
    condition_id         {1}
    DeriveryCharge_id    {1}
    area_id              {1}
    ScheduledDelivery_id {1}
    price {"9999"}
    

    association :user
  end
end
