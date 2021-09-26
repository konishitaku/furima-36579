FactoryBot.define do
  factory :item do
    merchandise    {"iphone"}
    text           {"これは説明文"}
    category_id    {"1"}
    status_id      {"1"}
    area_id        {"1"}
    load_id        {"1"}
    day_id         {"1"}
    price          {"10000"}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
