class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category    
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :shipping_location

  with_options presence: true, numericality: { other_than: 1 } do
    
   validates :category
   validates :condition
   validates :prefecture
   validates :shipping_date
   validates :shipping_location
  
   validates :category_id
   validates :condition_id
   validates :prefecture_id
   validates :shipping_date_id
   validates :shipping_location_id
  end
end
