require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many(:product_categories) }
  it { should have_many(:categories) }
  it { should belong_to(:product_unit) }
  it { should have_many(:categories).through(:product_categories) }
  it { should have_many(:order_details) }
  let(:product) { FactoryGirl.create(:product) }
end
