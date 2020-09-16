class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :delivery_charge, :delivery_time, :sending_address

  #空の投稿を保存できないようにする
  validates :category, :condition, :delivery_charge, :delivery_time, :sending_address, presence: true

  #選択が「--」のままになっていないか
  with_options numericality: { other_than: 1 } do
    validates :category_id, :condition_id, :delivery_charge_id, :delivery_time_id, :sending_address_id
  end

end
