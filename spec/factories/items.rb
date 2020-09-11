FactoryBot.define do
  factory :item do  
    name                 {'空'}
    introduction         {'ふええええええええええええええ'}
    price                {8000}
    condition_id         {2}
    shipping_date_id     {2}
    category_id          {2}
    prefecture_id        {2}
    shipping_location_id {2}
    association :user
  end
end
