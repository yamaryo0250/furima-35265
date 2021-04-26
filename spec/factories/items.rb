FactoryBot.define do
  factory :item do
    product { Faker::Commerce.product_name }
    genre_id { Faker::Number.within(range: 2..11) }
    text { Faker::Lorem.sentence }
    condition_id { Faker::Number.within(range: 2..7) }
    price { Faker::Number.within(range: 300..9_999_999) }
    charge_id { Faker::Number.within(range: 2..3) }
    area_id { Faker::Number.within(range: 2..48) }
    day_id { Faker::Number.within(range: 2..4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end