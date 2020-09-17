class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category    
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :shipping_location
  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true, numericality: { other_than: 1 } do
  
   validates :category_id
   validates :condition_id
   validates :prefecture_id
   validates :shipping_date_id
   validates :shipping_location_id
  end

  with_options presence: true do
    validates :name,length: {maximum:40}
    validates :introduction,length: {maximum:1000}
    validates :image
  end
  
  validates :price, numericality: {greater_than_or_equal_to:300,less_than_or_equal_to:9999999}
end
