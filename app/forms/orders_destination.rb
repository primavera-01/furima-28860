class OrdersDestination

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :post_code, :city, :house_number, :building_name, :telephone_number, :order_id, :price, :token

  UNDER_BAR_EXSIT = /\A[0-9]{3}-[0-9]{4}\z/
  NUMBER_DIFFERENT = /\A\d{10,11}\z/

  with_options presence: true do
    validates :post_code, format: { with: UNDER_BAR_EXSIT, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: NUMBER_DIFFERENT, message: 'is invalid. Include 10-11' }
    validates :token
  end





def save 
  order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Destination.create(prefecture_id: prefecture_id, post_code: post_code, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number,order_id: order.id)
  end


end
