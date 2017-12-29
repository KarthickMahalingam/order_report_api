FactoryBot.define do
  factory :order do
    association :customer, factory: :customer
    order_status { %w[waiting_for_delivery on_its_way delivered].sample }
    total_price { Faker::Commerce.price }
    no_of_items { Faker::Number.rand(max=20) }
    shipment_address { Faker::Address.building_number }
    shipment_city { Faker::Address.city }
    shipment_state { Faker::Address.state }
    shipment_country { Faker::Address.country }
    shipment_zip_code { Faker::Address.zip_code }
    order_placed_at { Date.today }
    order_shipped_at { Date.today }
  end
end