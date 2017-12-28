class ProductReportController < ApplicationController
  def show
    report_type_param = params[:report_type]
    @report = Product.product_wise_report(report_type_param)
    json_response(@report)
  end
end