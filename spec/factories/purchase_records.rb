FactoryBot.define do
  factory :purchase_record do
    postal_code {'003-0021'}
    region_id { 2 }
    city { '札幌市白石区' }
    house_number { '栄通6丁目9-27-301' }
    building_name { 'アレスタ' }
    phone_number { '09095101410' }
    token {"tok_abcdefghijk00000000000000000"}
    association :item
    user {item.user}

  end
end