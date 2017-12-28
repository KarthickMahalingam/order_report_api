class PeriodicReportController < ApplicationController
  def show
    report_type = params['report_type']
    start_range = params['start_range']
    end_range = params['end_range']
    @result = Product.create_periodic_report(report_type, start_range, end_range)
    json_response(@result)
  end

  private

  def check_range
    if report_type == 'daily'
      start_range.to_date < @end_range.to_date
      json_response('Error: Invalid date range'.to_json)
    end
  end

end