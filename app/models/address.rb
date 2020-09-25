class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # activehashモデルとのアソシエーション
  belongs_to_active_hash :sending_address

  belongs_to :order
end
