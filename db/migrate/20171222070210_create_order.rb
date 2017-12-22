class CreateOrder < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.string :status
      t.float :total_price
      t.integer :no_of_items
      t.datetime :order_placed_at
      t.datetime :order_shipper_at
      t.datetime :order_delivered_at
      t.string :shipto_address
      t.string :shipto_city
      t.string :shipto_state
      t.string :shipto_country
      t.string :shipto_zip_code
      t.string :payment_mode, default: 'CREDIT'
      t.string :tracking_number
      t.timestamps
    end
  end
end
