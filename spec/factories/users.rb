FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {'山田'}
    first_name {'太郎'}
    last_kana {'ヤマダ'}
    first_kana {'タロウ'}
    birthday {Faker::Date.birthday(min_age: 5, max_age: 91)}
  end
end