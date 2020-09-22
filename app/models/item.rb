class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # activehashモデルとのアソシエーション
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :sending_address

  # テーブルとのアソシエーション
  belongs_to :user
  has_one :order


  # activestorageとのアソシエーション
  has_one_attached :image

  #  必須項目
  with_options presence: true do
    validates :item_name
    validates :detail
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :delivery_time_id
    validates :sending_address_id
    #  価格は半角数字であること #  価格の範囲が、¥300~¥9,999,999の間であること
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end

  # 選択が「--」のままになっていないか
  with_options numericality: { other_than: 1 } do
    validates :category_id, :condition_id, :delivery_charge_id, :delivery_time_id, :sending_address_id
  end
end
