FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '12345678911' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
