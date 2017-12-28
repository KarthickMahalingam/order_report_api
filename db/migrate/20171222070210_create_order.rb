class CreateOrder < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.string :order_status
      t.float :total_price
      t.integer :no_of_items
      t.string :shipment_address
      t.string :shipment_city
      t.string :shipment_state
      t.string :shipment_country
      t.string :shipment_zip_code
      t.text :shipment_comments
      t.datetime :order_placed_at
      t.datetime :order_shipped_at
      t.datetime :order_delivered_at
      t.string :payment_mode, default: 'CREDIT'
      t.timestamps
    end
  end
end
