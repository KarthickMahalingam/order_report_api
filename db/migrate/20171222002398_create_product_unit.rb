class CreateProductUnit < ActiveRecord::Migration[5.0]
  def change
    create_table :product_units do |t|
      t.string :unit
    end
  end
end
