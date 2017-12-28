require 'pry'
class ExportReportController < ApplicationController
  def show
    report_type_param = params['report_type']
    reports = Product.product_wise_report(report_type_param)
    respond_to do |format|
      csv_service = ExportCsv.new
      format.html
      format.csv {
        send_data csv_service.to_csv(reports),
                  filename: "products-#{report_type_param}-#{Date.today}.csv"
      }
    end
  end
end