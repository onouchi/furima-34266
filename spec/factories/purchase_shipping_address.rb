FactoryBot.define do
  factory :purchase_shipping_address do
    
    token            {"tok_abcdefghijk00000000000000000"}
    postal_code      {"321-4567"}
    prefecture_id    {2}
    city             {"city_2"}
    house_number     {"number_2"}
    building_name    {"building_2"}
    phone_number     {"00312345678"}
    user_id          {1}
    item_id          {1}
    

    # association :user
    # association :item
  end
end

