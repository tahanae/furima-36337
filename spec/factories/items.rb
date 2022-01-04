FactoryBot.define do
  factory :item do
    title       {Faker::Lorem.sentence}
    explanation {Faker::Lorem.sentence}
    condition_id         {2}
    DeriveryCharge_id    {2}
    area_id              {2}
    ScheduledDelivery_id {2}
    category_id          {2}
    price {9999}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
