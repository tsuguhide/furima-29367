class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string       :zip_code
      t.integer      :sending_address_id
      t.string       :municipality
      t.string       :street_address
      t.string       :building
      t.string       :telephone_number
      t.references   :order
      t.timestamps
    end
  end
end
