class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #activehashモデルとのアソシエーション
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :sending_address

  # usersテーブルとのアソシエーション
  belongs_to :user

  #空の投稿を保存できないようにする
  validates :category, :condition, :delivery_charge, :delivery_time, :sending_address, presence: true

  #選択が「--」のままになっていないか
  with_options numericality: { other_than: 1 } do
    validates :category_id, :condition_id, :delivery_charge_id, :delivery_time_id, :sending_address_id
  end

end
