class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name
      t.text       :detail
      t.integer    :price
      t.integer    :condition_id
      t.integer    :category_id
      t.integer    :delivery_charge_id
      t.integer    :delivery_time_id
      t.integer    :sending_address_id
      t.references :user
      t.timestamps
    end
  end
end
