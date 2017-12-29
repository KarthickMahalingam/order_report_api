FactoryBot.define do
  factory :product_unit do
    unit { %w[lbs each oz].sample }
  end
end