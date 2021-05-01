class OrderInput
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid."} 
    validates :user_id
    validates :item_id
    validates :token, presence: {message: "クレジットカード情報を正しく入力してください"}
  end

  validates :phone_number, format: { with: /\A[0-9]+\z/,message: "は半角数字のみ使えます" }


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Input.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end