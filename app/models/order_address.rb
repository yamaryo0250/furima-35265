class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :house_num, :building, :tel, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :house_num
    validates :tel, format: {with: /\A\d{11}\z/}
    # validates :user_id
    # validates :item_id
  end
  validates :area_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, house_num: house_num, building: building, tel: tel, order_id: order.id)
  end
  
end
