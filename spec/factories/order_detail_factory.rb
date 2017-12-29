FactoryBot.define do
  factory :order_detail do
    association :product, factory: :product
    association :order, factory: :order
    price { Faker::Commerce.price }
    qty_ordered { Faker::Number.rand(max=20) }
    purchase_unit_price { Faker::Commerce.price }
    purchase_tax { Faker::Number.rand(max=20) }
  end
end