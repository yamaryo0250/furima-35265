FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    area_id { Faker::Number.within(range: 2..48) }
    municipality { "杉並区" }
    house_num { "3-4" }
    building { "グリーンハイツ" }
    tel { "09012345678" }
  end
end
