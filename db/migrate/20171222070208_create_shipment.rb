class CreateShipment < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.string :shipment_address
      t.string :shipment_city
      t.string :shipment_state
      t.string :shipment_country
      t.string :shipment_zip_code
      t.text :shipment_status
      t.text :shipment_comments
      t.string :carrier
      t.timestamps
    end
  end
end
