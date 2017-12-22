class CreateProductCategory < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.integer :product_id, nil: false, index: true
      t.integer :category_id, nil: false, index: true
      t.timestamps
    end
  end
end
