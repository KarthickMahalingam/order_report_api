require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:products).through(:product_categories) }
  it { should have_many(:product_categories) }
end
