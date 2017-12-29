require 'pry'
class ExportReportController < ApplicationController
  def show
    report_type_param = params['report_type']
    start_range = params['start_range']
    end_range = params['end_range']
    reports = Product.product_summary_report(report_type_param, start_range, end_range)
                     .as_json(except: :id)
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