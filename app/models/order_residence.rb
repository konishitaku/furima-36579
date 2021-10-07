class OrderResidence
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :town, :address, :building, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
      validates :area_id, numericality: { other_than: 0, message: "Select" }
      validates :town
      validates :address
      validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "can't be blank"}
      validates :user_id
      validates :item_id
      validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Residence.create(postal_code: postal_code, area_id: area_id, town: town, address: address, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end