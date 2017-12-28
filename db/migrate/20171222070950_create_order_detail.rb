class CreateOrderDetail < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.float :price
      t.float :qty_ordered
      t.float :purchase_unit_price
      t.float :purchase_tax
      t.float :purchase_discount
      t.string :color
      t.string :size
    end
  end
end
