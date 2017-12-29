FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    active { Faker::Boolean.boolean }
    phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    address { Faker::Address.building_number }
    city { Faker::Address.city }
    zip_code { Faker::Address.zip_code }
    state { Faker::Address.state }
    country { Faker::Address.country }
  end
end
