FactoryBot.define do
  factory :item do
    item_name              { 'りんご' }
    detail                 { '美味しい' }
    price                  { 300 }
    condition_id           { 2 }
    category_id            { 2 }
    delivery_charge_id     { 2 }
    delivery_time_id       { 2 }
    sending_address_id     { 2 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
