require 'rails_helper'
FactoryBot.define do
  factory :product do
    product_name { Faker::Commerce.product_name }
    description { Faker::Commerce.material }
    qty_in_stock { Faker::Number.rand }
    weight_in_stock { Faker::Measurement.weight }
    association :product_unit, factory: :product_unit
    unit_price { Faker::Commerce.price }
    tax { Faker::Number.rand }
    product_available { Faker::Boolean.boolean }
  end
end