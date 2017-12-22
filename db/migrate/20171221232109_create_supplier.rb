class CreateSupplier < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :supplier_name
      t.string :email
      t.integer :phone_number
      t.string :supplier_address
      t.string :country
      t.string :city
      t.string :state
      t.boolean :active
      t.integer :zip_code
    end
  end
end
