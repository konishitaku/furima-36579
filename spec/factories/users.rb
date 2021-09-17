FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {'山田'}
    first_name {'太郎'}
    last_name_kana {'ヤマダ'}
    first_name_kana {'太郎'}
    birthday {'2020-01-01'}
  end
end