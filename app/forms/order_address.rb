class OrderAddress

  include ActiveModel::Model
  attr_accessor :zip_code, :sending_address_id, :municipality, :street_address, :building, :telephone_number, :user_id, :item_id, :token

    #  必須項目
    with_options presence: true do
      #  郵便番号はハイフン必須であること
        validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
        validates :sending_address_id
        validates :municipality
        validates :street_address
        validates :telephone_number, format: { with: /\d{7,11}/i }
        validates :token
      end
    
      # 選択が「--」のままになっていないか
      with_options numericality: { other_than: 1 } do
        validates :sending_address_id
      end

      #  item_idが一意性であること(重複購入ができない)※ここまではしなくていい、後学と参考に残す
      #with_options uniqueness: true do
      #  validates :item_id
      #end
  

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, sending_address_id: sending_address_id, municipality: municipality, street_address: street_address, building: building, telephone_number: telephone_number, order_id: order.id )
  end



end