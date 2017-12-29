class PeriodicReportController < ApplicationController
  def show
    report_type = params['report_type']
    start_range = params['start_range']
    end_range = params['end_range']
    @result = Product.product_summary_report(report_type, start_range, end_range)
    json_response(@result.as_json(except: :id))
  end
end