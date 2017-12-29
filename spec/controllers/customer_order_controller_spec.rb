require 'rails_helper'
RSpec.describe CustomerOrderController, type: :controller do
  let!(:product_category) {FactoryBot.create(:product_category)}
  let!(:order_detail) {
    FactoryBot.create(:order_detail, product_id: product_category.product_id)
  }

  describe 'CustomerOrderController' do
    it 'should validate the routing' do
      expect(get: "report/customer/#{order_detail.order.customer.id}")
        .to route_to(controller: 'customer_order',
                     action: 'show',
                     customer_id: order_detail.order.customer.id.to_s)

    end
  end
end