class OrderAddress

  include ActiveModel::Model
  attr_accessor :zip_code, :sending_address_id, :municipality, :street_address, :building, :telephone_number, :user_id, :item_id, :token

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, sending_address_id: sending_address_id, municipality: municipality, street_address: street_address, building: building, telephone_number: telephone_number, order_id: order.id )
  end

end