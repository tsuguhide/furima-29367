FactoryBot.define do
  factory :order_address do
    zip_code               { '333-3333' }
    sending_address_id     { 2 }
    municipality           { '横浜市緑区' }
    street_address         { '青山１−１−１' }
    building               { '柳ビル２０１' }
    telephone_number       { 123_456_789 }
    token                  { 'tok_9a4c434397b0a9d4c1e1e8f034d1' }
  end
end

# association :user
# association :item
# association :order
# user_id     { 10 }
# item_id     { 15 }
