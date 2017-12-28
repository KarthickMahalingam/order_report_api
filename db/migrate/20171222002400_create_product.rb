class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :description
      t.integer :qty_in_stock
      t.float :weight_in_stock
      t.references :product_unit, foreign_key: true
      t.string :color
      t.string :unit_weight
      t.float :unit_price
      t.float :discount
      t.string :size
      t.float :tax
      t.boolean :product_available
      t.timestamps null:false
    end
  end
end
