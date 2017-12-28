class ReportsController < ApplicationController
  def show
    @customer_report = Customer.generate_customers_order_report
    json_response(@customer_report)
  end
end