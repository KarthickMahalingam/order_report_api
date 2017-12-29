require 'rails_helper'
RSpec.describe ReportsController, type: :controller do
  let!(:product_category){ FactoryBot.create(:product_category) }
  let!(:order_detail) {
    FactoryBot.create(:order_detail, product_id: product_category.product_id)
  }

  describe 'ReportsController' do
    it 'should return the result set on api call' do
      get 'show'
      expect(response.status).to eq 200
    end

    it 'should return the report content' do
      get 'show'
      expect(response.body).to_not be_nil
    end

    it 'should validate the routing' do
      expect(get: "report").to route_to(controller: 'reports',action: 'show')
    end
  end
end

