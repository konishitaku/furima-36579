FactoryBot.define do
  factory :order_residence do
    postal_code       {"123-4567"}
    area_id           {1}
    town              {"愛知県"}
    address           {"1-1"}
    building          {"ヤマトビル"}
    telephone_number  {"09012345678"}
    user_id {1}
    item_id {2}
    token {"tok_abcdefghijk00000000000000000"} 
  end
end