# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171222070950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.boolean "active"
    t.decimal "phone"
    t.string  "email"
    t.string  "address"
    t.string  "city"
    t.integer "zip_code"
    t.string  "state"
    t.string  "country"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.float   "price"
    t.float   "qty_ordered"
    t.float   "purchase_unit_price"
    t.float   "purchase_tax"
    t.float   "purchase_discount"
    t.string  "color"
    t.string  "size"
    t.index ["order_id"], name: "index_order_details_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_details_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "order_status"
    t.float    "total_price"
    t.integer  "no_of_items"
    t.string   "shipment_address"
    t.string   "shipment_city"
    t.string   "shipment_state"
    t.string   "shipment_country"
    t.string   "shipment_zip_code"
    t.text     "shipment_comments"
    t.datetime "order_placed_at"
    t.datetime "order_shipped_at"
    t.datetime "order_delivered_at"
    t.string   "payment_mode",       default: "CREDIT"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  end

  create_table "product_categories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category_id"], name: "index_product_categories_on_category_id", using: :btree
    t.index ["product_id"], name: "index_product_categories_on_product_id", using: :btree
  end

  create_table "product_units", force: :cascade do |t|
    t.string "unit"
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_name"
    t.text     "description"
    t.integer  "qty_in_stock"
    t.float    "weight_in_stock"
    t.integer  "product_unit_id"
    t.string   "color"
    t.string   "unit_weight"
    t.float    "unit_price"
    t.float    "discount"
    t.string   "size"
    t.float    "tax"
    t.boolean  "product_available"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_foreign_key "order_details", "orders"
  add_foreign_key "order_details", "products"
  add_foreign_key "orders", "customers"
  add_foreign_key "products", "product_units"
end
