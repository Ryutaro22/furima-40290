FactoryBot.define do
  factory :item do
    item_name { 'テスト商品名' }
    item_info { Faker::Lorem.sentence }
    prefecture_id { 2 }
    category_id { 2 }
    item_condition_id { 2 }
    shipping_period_id { 2 }
    postage_payer_id { 2 }
    item_price { 5555 }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
