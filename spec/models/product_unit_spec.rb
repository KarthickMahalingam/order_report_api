require 'rails_helper'

RSpec.describe ProductUnit, type: :model do
  it { should have_many(:products) }
end
