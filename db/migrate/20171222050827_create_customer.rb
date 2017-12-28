class CreateCustomer < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :active
      t.numeric :phone
      t.string :email
      t.string :address
      t.string :city
      t.integer :zip_code
      t.string :state
      t.string :country
    end
  end
end
