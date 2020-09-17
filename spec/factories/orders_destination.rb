FactoryBot.define do
  factory :orders_destination do
    post_code       { '123-4567' }
    prefecture_id  { 2 }
    city            { '横浜市旭区' }
    house_number           { '麻1-1' }
    building_name        { '丘ビル102' }
    telephone_number  { '09012345678' }
    user_id         { 4 }
    item_id         { 4 }
    token           { 'aaa' }
    # association :order
    
  end
end
