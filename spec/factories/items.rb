FactoryBot.define do
  factory :item do
    name {Faker::Lorem.word}
    explanation {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    delivery_charge_id {2}
    region_id {2}
    delivery_date_id {2}
    price {Faker::Number.within(range: 300..9999999)}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/16713.jpg'), filename: '16713.jpg')
    end
    
  end
end
