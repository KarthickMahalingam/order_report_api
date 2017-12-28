class CustomerOrderController < ApplicationController
  def show
    customer_id = params[:customer_id]
    @report = Customer.generate_customer_order_report(customer_id)
    json_response(@report)
  end
end